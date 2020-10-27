In Datadog, you can correlate your metrics, traces, and logs for 100% observability. <a href="https://docs.datadoghq.com/getting_started/tagging/" target="_blank">Tags</a> play a significant role in correlating these data types, specifically reserved tags like `service` and `source`, which you manually assigned to the `thinker-api` and `thinker-microservice` logs in the previous page. <a href="https://docs.datadoghq.com/getting_started/tagging/" target="_blank">Reserved tags</a> have specific meaning in Datadog and should only be assigned for their intended purposes.

Let's take a quick look at metrics, traces, and logs are correlated for the Flask application.

#### Logs and Metrics
1. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards > Dashboards List**</a>. 

    Notice the dashboards for Docker, Nginx, and Redis that are listed. Datadog created these dashboards when it automatically installed their Integrations.

2. Select the **NGINX - Metrics** dashboard to view the NGINX metrics that are visualized. 

    (Note: You can adjust the time range selector in the upper right if needed to see the nginx metrics for the Flask application.)

3. Click the graph for **Requests per second**. A menu appears with the graph metric at the top and a list of options to view related data/pages in Datadog. 

    ![nginx-metric-to-logs](collectlogs/assets/nginx-metric-to-logs.png)

4. Select **View related logs** from the menu. You will be redirected to the Log Explorer. A list of logs appears that are correlated to the metric at the timepoint in the graph that you had clicked on.

    Notice that `source:nginx` is in the search field above the log list, so the list is filtered on this tag. In fact, the `source:nginx` tag linked the graphed nginx metric to the nginx logs.

    ![nginx-metric-linked-log](collectlogs/assets/nginx-metric-linked-log.png)

5. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards > Dashboards List**</a>.

6. Select the **Redis - Overview** dashboard, click the graph for **Commands per second**, and select **View related logs** from the menu to view the correlated logs. Notice again that the `source` tags is listed in the search field

#### Logs and Traces

1. In the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, clear the search field. 

2. Select `thinker-api` in the **Service** list under the **Facets** tab on the left to filter the Logs List to logs from the `thinker-api` service.

3. Click a log from the filtered list to open the Log Side Panel.

4. Click the **Service** tile and select **Go to APM Service Page** from the menu. You will be redirected to the **Service List** filtered on `thinker-api`. You can click the service to view its details. 

    ![api-logs-to-service](collectlogs/assets/api-logs-to-service.png)

5. Repeats steps 1 to 4 for the `thinker-microservice`.

    The `service` tags correlates the log and trace data, allowing you to navigate directly to the related service from the log details.

    Note: <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/" target="_blank">Additional configuration</a> is needed to directly link log lines to the specific trace data using Trace IDs and Span IDs. One required step is processing the logs into the JSON format with parsed Datadog attributes. Again, you'll learn more about pipelines for processing logs in a later activity.


#### Assessment

Click `grademe`{{execute}} to receive a grade for completing this activity.

