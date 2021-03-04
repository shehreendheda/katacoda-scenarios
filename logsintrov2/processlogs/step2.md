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

    ![reordering-processors](processlogs/assets/reordering-processors.gif)

4. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a> and enter `service:store-frontend` as the search query. There may be a pause in the log stream while the new processor is starting to be applied to incoming logs. 

    Notice that the logs collected so far had the `INFO` status. In the facets on the left, select `Error` and `Ok` under **Status**. You'll see that the newer logs also have the `ERROR` and `OK` statuses.

    ![logs-new-status](processlogs/assets/new-log-status2.png)
