As a running example, we'll use the `movies-api-java` service from
<https://github.com/DataDog/dd-continuous-profiler-dash2021/>.

The `movies-api-service` service:

* Provides an API to list and search for movies and movie metadata.
* Is built using Java 17, using the [Gradle build tool](https://gradle.org/), the [Spark web framework](https://sparkjava.com/) and the
[Jetty web server](https://www.eclipse.org/jetty/).
* Uses [MongoDB](https://www.mongodb.com/) as a data store.

We've already cloned the repository above to the learning environment, so we can jump right in!

1. Let's run the `movies-api-java` service in the **Terminal for movies-api-java** tab:

  `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute T2}} (👆_Double click_)

2. After the service boots up, it can be accessed by going to:

  <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/>

3. You can also use `curl` to interact with the service:

  `curl http://localhost:8081/ | jq`{{execute T1}}

---

Proceed to the next step to start diagnosing a problematic request.
