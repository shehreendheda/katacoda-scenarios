In addition to exploring and analyzing your logs, you can also <a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">generate metrics</a> from your log data. Log-based metrics include counts of logs that match search queries or <a href="https://docs.datadoghq.com/metrics/distributions/#overview" target="_blank">distribution metrics</a> of numeric values contained in logs, such as request duration. Because of Datadog’s Logging without Limits*, log-based metrics are generated from all ingested logs, including those that are excluded during indexing or are archived, so that the resulting metrics data accurately represents your systems. You can also create Datadog <a href="https://docs.datadoghq.com/logs/logs_to_metrics/#recommended-usage-metrics" target="_blank">usage metrics</a> that you can analyze, monitor, and alert on in near real-time. Note: Generated metrics are considered <a href="https://docs.datadoghq.com/developers/metrics/custom_metrics/" target="_blank">custom metrics</a>, so have an additional cost.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/generate-metrics" target="_datadog">**Logs > Configuration > Generate Metrics**</a>.

2. Click **New Metric** in the upper right to open the Genetric Metric editor. 

3. Under **Define query**, enter `service:advertisements-service`{{copy}}, `service:discounts-service`{{copy}}, `status:error`{{copy}}.

    Below the query field, update group by to `Service`.

    Name the metric, `storedog.ads_discounts.errors.count`{{copy}}.