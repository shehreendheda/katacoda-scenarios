The <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#url-parser" target="_blank">URL Parser</a> extracts query parameters and other important parameters from a URL.

![log-status-attributes-m](logspipeline/assets/log-status-attributes-m.png)

1. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, click **Add Processor** for the `apache - flog` pipeline.

2. Under **Select the processor type**, select **URL Parser**.

3. Under **Set URL attribute**, enter `http.url`{{copy}}.

4. Under **Set target attribute path**, enter `http.url_details`{{copy}}.

5. Enter `Parsing URL`{{copy}} for **Name the processor**, and click **Save**.

    ![url-parser](logspipeline/assets/url-parser.png)

6. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new `flog` log.

    Notice that **Event Attributes** now lists the attribute group `url_details` and includes a banner with the `http.method`, `url_details` and `status_code`. Use the up and down arrow keys to look at more logs. 

    ![log-urlparse-attributes-m](logspipeline/assets/log-urlparse-attributes-m.png)
    
    Note: The `url_details` in these logs only include the `path` attribute, and the URL Parser correctly identifies and labels the url detail. If the url had more details, the `url_details` would look like this example.

    ![urlparse-example](logspipeline/assets/urlparse-example.png)

7. In the **Facets** on the left, expand the facet group **WEB ACCESS**, then expand the facet **URL Path** in this group. 

    Notice that the facet is now populated with the `url_details.path` attribute values. 

    ![facet-urlpath](logspipeline/assets/facet-urlpath.png)

    You can compare with the older logs by highlighting a region of the bar chart above the Logs List that corresponds to logs before you added the URL Parser. You'll see that the **URL Path** facet is empty. Reset the time range to **Past 15 minutes** using the time range selector. The **URL Path** facet will fill up again.

With the URL parsed, let's parse the User-Agent attribute in the logs.
