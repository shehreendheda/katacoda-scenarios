In Datadog, you can search and analyze your log data in the <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Log Explorer</a>. Let's apply log collection configurations you added and start exploring the log data for the Storedog app.

1. Click `docker-compose -f docker-compose-no-logs.yml up -d --build`{{execute}} to build the docker environment and bring the app online. 

    ![docker-compose-complete](collectlogsapp2/assets/docker-compose-complete.png)

2. In the terminal on the right, run the command `creds`{{execute}} in the terminal to display your Datadog app login credentials for this activity.

    In a new browser window/tab, navigate to <a href="https://app.datadoghq.com/account/login" target="_datadog">app.datadoghq.com</a> to log in to the Datadog account/organization using the login credentials provided in the terminal.  

3. If you've previously used the **Log Explorer** in the Datadog organization you are working in, navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog to view the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a>. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again to view the Log List.

4. In the search field, enter `env:ruby-shop` as the search query if it is not listed so that the Log List displays logs for the Storedog app only.

5. Select `15 min` in the time range selector in the upper right.

6. In the **Facets** list, expand the **Source** and **Service** lists. **Service** to view the services from the app that are injecting traces into Datadog. 

    ![logs-sources-services](collectlogsapp2/assets/logs-sources-services.png)

    Notice that they match the sources and services you added using the `com.datadoghq.ad.logs` Docker labels.

6. In the **Facets** list, select the `store-frontend` under **Service**.

    Click a log for the `store-frontend` service that has **Content** similar to `Completed #xxxx`.

    The <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the log details will open.

    ![frontend-log-detail](collectlogsapp2/assets/frontend-log-detail.png)
    
    Notice that the `source` is `ruby` and the `service` is `store-frontend`.

    Click the`service` tile and select **Go to APM service page**. A new browser tab will open with the **Service List** filtered on `store-frontend`. Close this tab.

    Notice that there is a list of **Event Attributes** because the log is processed. Because `ruby` is recognized as the log source, the logs from the service are being collected by the `ruby` Integration and are being processed by the `ruby` Integration Pipeline.
    
    Also, notice that the **Traces** tab shows a linked trace. In the upper right of the trace, you can click **View trace details** to open the trace in a new tab. Below the trace, click the **Logs** tab. Notice the `trace_id` filter. Click the log under the filter. The same log you were viewing will reopen in the Log Explorer with the Log List filtered on the `trace_ID`. The `trace_ID` links the log to the corresponding trace in APM. Close the two new tabs that were opened.

    Close the Logs Side Panel.

7. In the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, make sure `env:ruby-shop` is the search query.

8. In the **Facets** list, select the `discounts-service` under **Service**.

    Click a log for the `discounts-service` service that has **Content** similar to `...INFO [bootstrap]...` to open the log side panel.

    ![discounts-log-details](collectlogsapp2/assets/discounts-log-details.png)
    
    Notice that the `source` is `python` and the `service` is `discounts-service`. 

    Notice that there is a list of **Event Attributes** because the log is processed. Because `python` is recognized as the log source, the logs from the service are being collected by the `python` Integration and are being processed by the `python` Integration Pipeline.

    Also, notice that the **Traces** tab shows a linked trace.

9. In the **Facets** list, select the `advertisements-service` under **Service**.

    Click a log for the `advertisements-service` that has **Content** similar to `...INFO [bootstrap]...` to open the log side panel.

    ![ads-log-details](collectlogsapp2/assets/ads-log-details.png)
    
    Notice that the `source` is `python` and the `service` is `advertisements-service`. 

    Notice that there is a list of **Event Attributes** because the log is processed. Because `python` is recognized as the log source, the logs from the service are being collected by the `python` Integration and are being processed by the `python` Integration Pipeline.

    Also, notice that the **Traces** tab shows a linked trace.

10. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configurations > Pipelines**</a> to see the of Integration Pipelines for the log sources: **Datadog Agent**, **python**, **Ruby**.


### Assessment

You can continue to explore the log data from the Storedog App. When you are done, click `grademe`{{execute}} to receive a grade for this activity.