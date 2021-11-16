Up until now, everything seems to be going well in `movies-api-java`-land.

Let's try a different task: getting movie credits, for all movies with _Jurassic_ in their name.

1. Run `curl` to query for this information:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

  (You can also use your browser or local terminal to query <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/credits?q=jurassic>)

2. Observe that this endpoint seems to be quite slow:

  ```
  real    0m4.208s
  user    0m0.042s
  sys     0m0.012s
  ```

  `movies-api-java` is taking a lot of time to respond to these queries, which makes for a poor user experience.

  Why are these requests taking so long? Let's use Datadog to find out.

---

Proceed to the next step to add Datadog APM and Continuous Profiling to `movies-api-java`.
