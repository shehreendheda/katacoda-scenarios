You navigate to APM to investigate the trace data for getting movie credits for all movies with _Jurassic_ in their title and determine how to improve performance of the service.

1. Click the `curl` command below to query for this information, or copy, paste, and run the command in the terminal:

  `time curl http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  In the Facets on the left, select `movies-api-java` under **Service** to filter the list to the trace for the request you made to the service.

  Click the `movies-api-java` trace that appears in the list. This trace corresponds to the request you made to the service in the earlier step.

3. Notice that the top span corresponding to the `movies-api-java` service has many child spans. 

  Hover over the childs spans. Notice that they are all for the `mongo` service.

  Above the flame graph, click **Span List** to view the list of spans. The `mongo` services keep  


3. **Presented Live**: _What can we learn from the traced request using APM Traces?_

---

Proceed to the next step to fix this performance issue on `movies-api-java`.
