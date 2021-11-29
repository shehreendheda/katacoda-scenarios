You previously requested the movie credits for all movies with _Jurassic_ in their name. This retrieved credits for eight movies. You now try to request movie credits for all movies with the word _The_ in their title, which will return a significantly greater number of results.

1. Click the `curl` command below to query for this information, or copy, paste, and run the command in the terminal:

  `time curl http://localhost:8081/credits?q=the >> /dev/null`{{execute T1}}

  (You may not be able to the view the full output in the terminal. You can click this link to view the full output for this search in another browser tab: <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/credits?q=the>)

  In the terminal, you observe that this endpoint performs quite slowly when retrieving a significantly greater number of results. For example, you may see a result like the one below:

  ```
  real    0m19.524s
  user    0m0.011s
  sys     0m0.011s
  ```
2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  In the Facets on the left, select `movies-api-java` under **Service** to filter the list to the trace for the request you made to the service.

  Click the `movies-api-java` trace that appeared at the top of the list. This trace corresponds to the request you made to the service in the earlier step.

  Notice that the top span corresponding to the `movies-api-java` service has no child spans. The APM trace provides no further visibility into the underlying processes that can explain why the service performed slowly to retrieve the result. 

3.  Scroll below the flame graph and click the tab labeled **Code Hotspots**.
