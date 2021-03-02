Once you've created a Pipeline, you can add processors to it based on the log processing needs.

Available processors include the following:

- <a href="https://docs.datadoghq.com/logs/processing/parsing" target="_blank">Grok Parser</a>, which can extract attributes from semi-structured text messages

- Several remappers that remaps source attributes to target standard attributes

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#category-processor" target="_blank">Category Processor</a>, which <a href="https://www.datadoghq.com/blog/how-to-categorize-logs/" target="_blank">enrich logs</a> with attributes that categorize them

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#lookup-processor" target="_blank">Lookup Processor</a>, which defines a mapping between a log attribute and a human readable value saved in an Enrichment Table (beta) or the processors mapping table.

Right now, the `store-frontend` logs in the Logs List do not display the official log status automatically. The offical log status is mapped to the `level` attribute in the collected/processed logs. Let's update the cloned pipeline you created earlier to include a category processor that categorizes the `http.status_code` in severity levels, so that the official log status is accurate.

| Category | Name |
| -------- | ---- |
| @http.status_code:[200 TO 299] | ok |
| @http.status_code:[300 TO 399] | notice |
| @http.status_code:[400 TO 499] | warning |
| @http.status_code:[500 TO 599] | error |

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a>

2. Expand the **ruby clone for store-frontend** pipeline and click **Add Processor** at the bottom of the processor list to open the new processor window. 

    Under **Select the processor type**, select **Category Processor**.

    Under **Set target category attributes**, enter `http.status_code_category`{{copy}}.

    Under **Populate category**, enter `@http.status_code:[200 TO 299]`{{copy}} for **All events that match** and `ok`{{copy}} for **Appear under the value name**. Click **Add**. You'll see the columns under **Review added entries** populate with this information.

    Repeat the step above for the remaining categories and names:

    * `@http.status_code:[300 TO 399]`{{copy}} and `notice`{{copy}}
    * `@http.status_code:[400 TO 499]`{{copy}} and `warning`{{copy}}
    * `@http.status_code:[500 TO 599]`{{copy}} and `error`{{copy}}

    Enter `Assign http.status_code to severity level`{{copy}} for **Name the processor** and click **Save**. The category processor will be added to the bottom of the processor list.

    ![level-categories](processlogs/assets/level-categories.png)

3. For the correct severity level to be remapped to the official log status, you'll need to move the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#log-status-remapper" target="_blank">Status Remapper</a> below the new Catagory Processor.

    In the processors list, click the six dot icon for the **Status Remapper** and drag and drop the processor below the **Category Processor**. You see a warning pop up about the change in the order of the processors affecting processing. Click **Reorder**.

    ![reorderingprocessors](processlogs/assets/reorderingprocessors.gif)

4. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a> and enter `service:store-frontend` as the search query.

    Notice that there are logs listed so far have the `INFO` status. In the facets on the left, select `Error` and `Ok` under **Status**. 

    There may be a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new **store-frontend** log.

    ![logs-new-status](processlogs/assets/new-log-status2.png)

    You can compare with the older logs by highlighting a region of the bar chart above the Logs List that corresponds to logs before you added the URL Parser. You'll see that the **URL Path** facet is empty. Reset the time range to **Past 15 minutes** using the time range selector. The **URL Path** facet will fill up again.

    In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. 

    Notice that the new logs in the list and in the chart above the list have different color bars and that the **Status** Facet has more options.
    
    ![logs-new-status](processlogs/assets/new-log-status2.png)

    Click a new **flog** log. Notice that the official status now matches the `http.status_code_category` value. Use your up and down arrow keys to look at the statuses of more logs.

    ![log-status-full-m](processlogs/assets/log-status-full-m.png)

    The official log statuses are now assigned based on the severity derived from http.status_codes in the logs. 
