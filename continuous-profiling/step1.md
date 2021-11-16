Imagine you have a `movies-api-service` service with the following features:

* Provides an API to list and search for movies and movie metadata.
* Is built using Java 17, using the [Gradle build tool](https://gradle.org/), the [Spark web framework](https://sparkjava.com/) and the
[Jetty web server](https://www.eclipse.org/jetty/).
* Uses [MongoDB](https://www.mongodb.com/) as a data store.

You want to optimize the performance of the service to ensure that users have the best experience. To do so, you first bring the service online, and then make some requests to service to see how it performs. 

1. Run the `movies-api-java` service in the **Terminal for movies-api-java** tab to bring the service online.

  `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute T2}} (👆_Double click_)

  When the service is online, you'll see the following in the terminal.

  Click the link below to open the service in another browser tab:

  <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/>

  You can also run the `curl` to interact with the service:

  `curl http://localhost:8081/ | jq`{{execute T1}}

2. The `movies-api-java` service came online successfully and is responding to requests. You now want to make sure that users can search for movies credits using keywords, so you try to search the service for all movies with _Jurassic_ in their name.

  Click the `curl` command below to query for this information:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

  (You can also click this link to view the results for this search in another browser tab: <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/credits?q=jurassic>)

  In the terminal, you observe that this endpoint seems to be quite slow. For example, you may see a reults like the one below:

  ```
  real    0m4.208s
  user    0m0.042s
  sys     0m0.012s
  ```

  The service is taking longer than expected to respond to these queries, which makes for a poor user experience.

  Why are these requests taking so long? You decide to use Datadog to find out why.
