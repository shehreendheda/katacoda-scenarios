With the <a href="https://docs.datadoghq.com/logs/explorer/#fields" target="_blank">Fields</a> aggregation, all logs matching the query filter are aggregated into groups based on the value of a log facet. For these groups, you can extract counts of logs per group, unique count of coded values for a facet per group, and statistical operations on numerical values of a facet per group.

1. In <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>, filter the list to the `service:advertisements-service`, `service:discounts-service`, `ERROR`.

2. Select `Fields` for **Aggregate as** below the search field. A graph visualization of the filtered logs will appear.  

    Group the fields by service so that it reads **Aggregate as** `Fields` of `Service`.

    Above the graph, you'll see that `Timeseries` is selected. Select `Toplist` next to Timeseries, then select `Table` to view the difference visualizations.

    [gif]

3. Click **Export** above the graph. You can export the visualization areas of the product, such as a Logs Monitor, to a dashboard, and to generate a log-based metric (<a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">Generate Metrics</a>).

4. Use the facets on the left to change the data that is visualized. You can also save the visualization, by clicking Save about the search field.



