In addition to exploring and analyzing your logs, you can also <a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">generate metrics</a> from your log data. Log-based metrics include counts of logs that match search queries or <a href="https://docs.datadoghq.com/metrics/distributions/#overview" target="_blank">distribution metrics</a> of numeric values contained in logs, such as request duration. Because of Datadog’s Logging without Limits*, log-based metrics are generated from all ingested logs, including those that are excluded during indexing or are archived, so that the resulting metrics data accurately represents your systems. You can also create Datadog <a href="https://docs.datadoghq.com/logs/logs_to_metrics/#recommended-usage-metrics" target="_blank">usage metrics</a> that you can analyze, monitor, and alert on in near real-time. Note: Generated metrics are considered <a href="https://docs.datadoghq.com/developers/metrics/custom_metrics/" target="_blank">custom metrics</a>, so have an additional cost.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/generate-metrics" target="_datadog">**Logs > Configuration > Generate Metrics**</a>.

2. Click **New Metric** in the upper right to open the Genetric Metric editor. 

3. Under **Define query**, enter `service:advertisements-service`{{copy}}, `service:discounts-service`{{copy}}, `status:error`{{copy}}.

    Below the query field, update **group by** to `Service`.

    Name the metric `storedog.ads_discounts.errors.count`{{copy}}.

    Click **Create Metric**.

    The new metric will appear in the custom metrics list.

    ![generatemetric](monitorlogs/assets/generatemetric.gif)

4. Hover over the new metric you created. On the right, you see different icons appear. 

    Hover over the icons and select the one for **See in Metric Explorer**. A new tab will open for the Metric Explorer.
    
    The new metric is already selected under **Graph** and the timeseries for the graph is visualized.

    In the bottom left, under **Export these graphs to** select **Existing dashboard**. 
    
    In the Export to dashboard window that appeared, select the dashboard you created earlier `Storedog Logs` and click **Export**. 
    
    You will see a message that says `Graphs exported to **Storedog Logs**!`. Click **View dashboard** to open the dashboard in a new tab.

5. In the `Storedog Logs` dashboard, notice that there is now a Timeseries widget in the dashboard for the new metric you just created.

    Click **Edit Widgets**. Click and drag the new widget to closer to the `count of advertisements and discounts error logs` Timeseries widget you created earlier.

    Click the edit icon for the new widget. 

    Under Set display preferences, select **Show legend on graph**.

    Leave the graph title as is, and click **Save**.

    Click **Save Changes** above the dashboard.

    Notice that the two timeseries graphs are identical.

    ![newmetric-timeseries](monitorlogs/assets/newmetric-timeseries.gif)