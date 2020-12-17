These logs are http access logs and usually don't have an assigned severity. You can assign the severity using the `http.status_code` attribute in the logs(indicated in the box in the image below). First, you'll need to enrich the logs by creating status code categories for severity.

![log-parsed-attributes](logspipeline/assets/log-parsed-attributes.png)

You can use the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#category-processor" target="_blank">Category Processor</a> to create the status code categories listed below.

| Category | Name |
| -------- | ---- |
| @http.status_code:[200 TO 299] | ok |
| @http.status_code:[300 TO 399] | notice |
| @http.status_code:[400 TO 499] | warning |
| @http.status_code:[500 TO 599] | error |

1. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, click **Add Processor** for the `apache - flog` pipeline.

2. Under **Select the processor type**, select **Category Processor**.

3. Under **Set target category attributes**, select **Category Processor**.

4. Under **Populate category**, enter `@http.status_code:[200 TO 299]`{{copy}} for **All events that match** and `ok`{{copy}} for **Appear under the value name**. Click **Add**.

    You'll see the columns under **Review added entries** populate with this information.

5. Repeat step 4 for the remaining categories and names:

    * `@http.status_code:[300 TO 399]`{{copy}} and `notice`{{copy}}
    * `@http.status_code:[400 TO 499]`{{copy}} and `warning`{{copy}}
    * `@http.status_code:[500 TO 599]`{{copy}} and `error`{{copy}}

6. Enter `Assigning severity based on status code`{{copy}) for **Name the processor** and click **Save**.

    ![category-processor](logspipeline/assets/category-processor.png)
    
7. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new **flog** log.

    Notice that there is now a `http.status_code_category` attribute (boxed in image above) listed under the **Event Attribute**.

    ![log-catproc-attributes](logspipeline/assets/log-catproc-attributes.png)

    But, also notice that the official log status does not match the `http.status_code_category`. In the example image below, the offical log status is `info`, but the `http.status_code_category` is `error`.

    ![log-catproc-full](logspipeline/assets/log-catproc-full.png)

To assign the correct severity value to the log, you'll need to to remap the official log status to the `http.status_code_category` attribute.