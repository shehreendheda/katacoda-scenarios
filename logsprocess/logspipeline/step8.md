So far, you've created a pipeline that extracts attributes using the Grok Parser, enriches logs with an official Status based on categorized HTTP status codes, and enriches the logs with parsed URL and User-Agent attributes. At this point, you can say that the logs are processed and ready for <a href="https://docs.datadoghq.com/logs/explorer/analytics/" target="_blank">analytics</a>, <a href="https://docs.datadoghq.com/monitors/monitor_types/log/" target="_blank">monitors</a>, <a href="https://docs.datadoghq.com/dashboards/widgets/log_stream/" target="_blank">dashboarding</a>, etc. But let's do some advanced processing to leverage the Patterns feature in Logs.

The <a href="https://docs.datadoghq.com/logs/explorer/patterns/" target="_blank">Pattern</a> feature uses the log status, service, and message to decipher common patterns in your logs and suggest parsing rules.

![logs-useragent-patterns](logspipeline/assets/logs-useragent-patterns.png)

When you look at the patterns for the logs, you'll see that there are hundreds of patterns. But, so far, you've used 1 pattern to create 1 parsing rule that processed (almost) all of the logs. Let's refactor the log message using the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#string-builder-processor" target="_blank">String Builder Processor</a> into a message that the pattern feature can better decipher.

1. In the **Logs** browser tab, close the log details if it is open and select the **Patterns** feature next to the search field.

2. Enter the `service:flog`{{copy}} into the search field or select the `flog` under the **Service** facet.

    Scroll through the list of patterns. Notice that there are hundreds of patterns based on the User-Agent details.
    
    Click a few of the patterns, and view their parsing rules by click **Show parsing rule** in the upper right of the pattern details.

    ![logs-useragent-pattern-details](logspipeline/assets/logs-useragent-pattern-details.png)

3. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, click **Add Processor** for the `apache - flog` pipeline.

4. Under **Select the processor type**, select **String Builder Processor**.

3. Under **Set the target attribute path**, enter `temp_msg`{{copy}}.

4. Under **Set the target attribute value**, enter `Request %{http.method} %{http.url_details.path} with response %{http.status_code}`{{copy}}. Make sure **Replace missing attribute by an empty string** is selected.

5. Leave the **Name the processor** field as is. This field is automatically filled in while you are typing the target attribute value. Click **Save**.

    ![string-builder](logspipeline/assets/string-builder.png)

6. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. You'll notice that there is a pause in the log stream while the new processor is starting to process incoming logs. When new logs start coming in, click a new `flog` log.

    Notice that **Event Attributes** now lists the attribute `temp_msg`. 

    ![log-tempmsg-attributes-m](logspipeline/assets/log-tempmsg-attributes-m.png)

    Note: Like in the image, you can also collapse the `http` and `network` attribute groups by click the **-** icon next to them.

With the new message as an attribute, you can now remap the new message as the official log message.


