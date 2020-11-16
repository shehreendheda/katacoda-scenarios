The <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#user-agent-parser" target="_blank">User-Agent</a> parser takes a User-Agent attribute and extracts the OS, browser, device, and other user data. 

![log-urlparse-attributes-m2](logspipeline/assets/log-urlparse-attributes-m2.png)

1. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, click **Add Processor** for the `apache - flog` pipeline.

2. Under **Select the processor type**, select **User-Agent Parser**.

3. Under **Set User-Agent attribute**, enter `http.useragent`{{copy}}.

4. Under **Set target attribute path**, enter `http.useragent_details`{{copy}}. Do not select **Apply a URL decode first**.

5. Enter `Parsing User-Agent`{{copy}} for **Name the processor**, and click **Save**.

    ![url-parser](logspipeline/assets/url-parser.png)

6. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new `flog` log.

    Notice that **Event Attributes** now lists the attribute group `useragent_details` that include attributes for `browser`, `device`, and `os`.

    ![log-useragent-attributes-m](logspipeline/assets/log-useragent-attributes-m.png)

7. In the **Facets** on the left, expand the facet group **WEB ACCESS**, then expand the facets **OS**, **Browser**, and **Device** in this group. 

    Notice that the facets are now populated with attribute values. 

    ![facet-useragent](logspipeline/assets/facet-useragent.png)

    You can compare with the older logs by highlighting a region of the bar chart above the Logs List that corresponds to logs before you added the User-Agent Parser. You'll see that the **OS**, **Browser**, and **Device** facets are empty. Reset the time range to **Past 15 minutes** using the time range selector. The **URL Path** facet will fill up again.

You've succesfully created a custom pipeline that extracts attributes using the Grok Parser, enriches logs with an official status based on categorized HTTP status codes, and enriches the logs with parsed URL and User-Agent attributes. The processed logs can now be used more effectively in <a href="https://docs.datadoghq.com/logs/explorer/analytics/" target="_blank">analytics</a>, <a href="https://docs.datadoghq.com/monitors/monitor_types/log/" target="_blank">monitors</a>, <a href="https://docs.datadoghq.com/dashboards/widgets/log_stream/" target="_blank">dashboards</a>, etc. 

As a final step, let's compare the logs processed by the custom pipeline with those processed by the Apache Integration Pipeline.