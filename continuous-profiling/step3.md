You navigate to APM in Datadog to investigate the trace data for requesting movie credits for all movies with _Jurassic_ in their title and determine how to improve performance of the service.

1. Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  In the search query above the traces list, enter `env:staging`{{copy}} and `service:movies-api-java`{{copy}} to filter the list to the trace for the request you made to the service.

  Click the `movies-api-java` trace that appears in the list. This trace corresponds to the request you made to the service in the earlier step.

3. Notice that the top span corresponding to the `movies-api-java` service has many child spans. 

  Hover over the child spans. Notice that they are all for the `mongo` database service.

  Above the flame graph, click **Span List** to view the list of spans. The `mongo` service is repeatedly called to fulfil the request for movie credits data from `movies-api-java`.
  
4. You check the source file to understand why repeated calls are being made to the database to fulfill the request for movie credits data.

  In the editor on the right, open the main `movies-api-java` server source file by clicking this filename: `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}}

  Scroll to **Line 36**. Here you see a java `Supplier` stores the results from the `Server::loadCredits` method as the constant `CREDITS`. (In Java 8, `Supplier` is a functional interface; it takes no arguments and returns a result.)
  
  Scroll to **Line 122** to view `Server::loadCredits` method. Notice that the method creates a new connection to the `mongo` database, then performs a request to the credits collection and uses the stream option to read the whole stream of credits.

  Scroll to **Line 47**. When the application is started, `CREDITS` is used to warm up the service.

  Scroll to **Line 76**. This line is code for the `creditsForMovie` function. `CREDITS` is also used when a request is made to the service to retrieve movie credits data using this function. Each time the movie credits data for a movie is retrieved, a connection is made to the database and the credits data for that movie is retrieved. The database is read for each movie that matches the query to the database.

5. You can check how many movies are retrieved with the query.

  Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab:

  `time curl http://localhost:8081/credits?q=jurassic | jq ".[] | .movie.title"`{{execute T1}}

  You'll see tha eight movie titles are returned for this query.

  View the **Span List** again. Notice that eight connections are made to the database to retrieve the movie credits data for the eight movies.     

  The movie credits data doesn't change often. When `movies-api-java` is brought online, it should make one request to the database and cache the movie credits data. With the data cached during start up, if the movie credits data is requested from the service later on, repeated calls to the database will not be made.

6. With this in mind, you update the `CREDITS` supplier with a version that caches the movie credits the first time the data is retrieved by adding `memoizes` to the command. Click the code block to update the `CREDITS` supplier on **line 36**:

  <pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="CREDITS = Server::loadCredits">CREDITS = Suppliers.memoize(Server::loadCredits)</pre>

7. Re-run the application by clicking this command to restart the service: `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

8. Click the `curl` command below to rerun the query above, or copy, paste, and run the command in the **Terminal** tab:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

  Notice that the performance of the endpoint, as measured using `time`, has now improved.

9. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  Make sure the list is still filtered to `env:staging`{{copy}} and `service:movies-api-java`{{copy}}.

  Click the new `movies-api-java` trace that appeared in the list after you reran the query.

  Notice that the top span corresponding to the `movies-api-java` service no longer has child spans for the `mongo` service. 

You were able to solve this performance issue usng APM. However, other issues may also exist in the service that may not be visible in the APM traces. You decide to investigate the service further to ensure that there are no other performance issues when requesting movie credits.
