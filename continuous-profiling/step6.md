As identified in the previous step, we want to cache the credits information, rather than re-reading it from the
database on every new request.

To do so:

1. Open the main `movies-api-java` source file:

  `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}}

2. Replace the `CREDITS` supplier (`Server.java`, line 36) with a version that caches (_memoizes_) the credits:

  <pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="CREDITS = Server::loadCredits">CREDITS = Suppliers.memoize(Server::loadCredits)</pre>

3. Re-run the application using:

   `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

4. Run `curl` to repeat our query:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

  Observe that the performance of the endpoint, as measured using `time`, has now improved.

5. Locate the fixed request on the <a href="https://app.datadoghq.com/apm/traces" target="_datadog">Datadog APM Traces</a> page
and confirm that no database queries are needed to generate a response to this endpoint.

---

Proceed to the next step to investigate another problematic request.
