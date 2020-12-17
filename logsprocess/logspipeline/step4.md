As noted, although you've defined the severity of each log using the new attribute `http.status_code_category`, the official status of the log does not reflect the change.

![log-catproc-full-m](logspipeline/assets/log-catproc-full-m.png)

The <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#log-status-remapper" target="_blank">Status Remapper</a> allows you remap the status of your logs based on one or more selected attributes. The Status Remapper recognizes specific (attribute) values to define statuses, so it's best to consult the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#log-status-remapper" target="_blank">Status Remapper</a>  documentation before you select the status attribute to define your offical log statuses. 

1. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, click **Add Processor** for the `apache - flog` pipeline.

2. Under **Select the processor type**, select **Status Remapper**.

3. Under **Set status attribute(s)**, enter `http.status_code_category`{{copy}}.

4. Enter `Remapping http.status_code_category as official log status`{{copy}} for **Name the processor** and click **Save** 

    ![status-remapper](logspipeline/assets/status-remapper.png)

5. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. 

    Notice that the new logs in the list and in the chart above the list have different color bars and that the **Status** Facet has more options.
    
    ![logs-new-status](logspipeline/assets/logs-new-status.png)

    Click a new **flog** log. Notice that the official status now matches the `http.status_code_category` value. Use your up and down arrow keys to look at the statuses of more logs.

    ![log-status-full-m](logspipeline/assets/log-status-full-m.png)

    The official log statusese are now assigned based on the severity derived from http.status_codes in the logs. 

You've successfully enriched the logs with the correct status, let's now further enrich the logs by parsing the URL and the User-Agent attributes.
