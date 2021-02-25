In Datadog, you can search and analyze your log data in the <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Log Explorer</a>. Let's apply log collection configurations you added and start exploring the log data for the Storedog app.

1. Click `docker-compose -f docker-compose-fixed.yml up -d --build`{{execute}} to rebuild the docker environment to apply the log collection configurations you added. 

    ![restarted-agent-frontend](collectlogsapp2/assets/restarted-agent-frontend.png)

2. If you've previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

3. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog to view the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a>. 

4. In the search field, enter `env:ruby-shop` as the search query if it is not listed so that the Log List displays logs for the Storedog app only.

5. Select `15 min` in the time range selector in the upper right.

6. In the **Facets** list, expand the **Source** and **Service** lists. **Service** to view the services from the app that are injecting traces into Datadog. 

    ![logs-sources-services](collectlogsapp2/assets/logs-sources-services.png)

    Notice that they match the sources and services you added using the `com.datadoghq.ad.logs` Docker labels.

6. Click a log for the `store-frontend` service that has a structure that is similar to the log in the image below. (Click the image to expand it.)

    ![frontend-example-log](collectlogsapp2/assets/frontend-example-log.png)

    The <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the log details will open.

    ![frontend-log-detail](collectlogsapp2/assets/frontend-log-detail.png)
    
    Notice that the `source` is `ruby` and the `service` is `store-frontend`.

    Click the`service` tile and select **Go to APM service page**. A new browser tab will open with the **Service List** filtered on `store-frontend`.

    Notice that there is a list of **Event Attributes** because the log is processed. Because `ruby` is recognized as the log source, the logs from the service are being collected by the `ruby` Integration and are being processed by the `ruby` Integration Pipeline.
    
    Also, notice that the **Traces** tab shows a linked trace. In the upper right of the trace, you can click **View trace details** to open the trace in a new tab. Below the trace, click the **Logs** tab. Notice the `trace_id` filter. Click the log under the filter. The same log you were viewing will reopen in the Log Explorer with the Log List filtered on the `trace_ID`. The `trace_ID` links the log to the corresponding trace in APM. 
    

7. In the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, make sure `env:ruby-shop` is the search query.

8. Click a log for the `discounts-service` that has a structure that is similar to the log in the image below. 

    ![discounts-example-log](collectlogsapp2/assets/discounts-example-log.png)

    The Log Side Panel with the log details will open.

    ![discounts-log-details](collectlogsapp2/assets/discounts-log-details.png)
    
    Notice that the `source` is `python` and the `service` is `discounts-service`. 

    Notice that there is a list of **Event Attributes** because the log is processed. Because `python` is recognized as the log source, the logs from the service are being collected by the `ruby` Integration and are being processed by the `python` Integration Pipeline.

    Also, notice that the **Traces** tab shows a linked trace.

9. Click a log for the `advertisements-service` that has a structure that is similar to the one shown below. 

    ![ads-example-log](collectlogsapp2/assets/ads-example-log.png)

    The Log Side Panel with the log details will open.

    ![ads-log-details](collectlogsapp2/assets/ads-log-details.png)
    
    Notice that the `source` is `python` and the `service` is `advertisements-service`. 

    Notice that there is a list of **Event Attributes** because the log is processed. Because `python` is recognized as the log source, the logs from the service are being collected by the `ruby` Integration and are being processed by the `python` Integration Pipeline.

    Also, notice that the **Traces** tab shows a linked trace.

10. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configurations > Pipelines**</a>. to see the of Integration Pipelines for the log sources: **Datadog Agent**, **python**, **Ruby**, and **Postgresql**.


### Assessment

You can continue to explore the log data from the Storedog App. When you are done, click `grademe`{{execute}} to receive a grade for this activity.