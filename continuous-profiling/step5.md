Let's revisit the problematic task: getting movie credits, for all movies with _Jurassic_ in their title.

1. Run `curl` to query for this information:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

2. Browse to the <a href="https://app.datadoghq.com/apm/traces" target="_datadog">Datadog APM Traces</a> page and find the request.

3. **Presented Live**: _What can we learn from the traced request using APM Traces?_

---

Proceed to the next step to fix this performance issue on `movies-api-java`.
