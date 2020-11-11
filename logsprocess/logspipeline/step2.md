The first step in processing logs is to parse the logs for its attributes. Datadog provides a Grok Parser 

1. Expand the new `apache - flog` pipeline you created and click **Add Processor**.

    ![new-flog-pipeline](logspipeline/assets/new-flog-pipeline.png)
     
2.  Under **Select the processor type**, select **Grok Parser**.

3. In the tab with Log Explorer, click a log detail.

    Copy the log message (text in gray box) into the log sample. Note: There is a copy icon in the upper right corner of the log message. Click the icon to copy the log message.

3. In the Grok Parser, paste the log sample into the **Log samples** field.

    Now, that you've pasted your log sample, let's define the rule. Because the logs in this source are complex, you can use the rule below to save time. However, you can click **Answer** below the steps on this page to see how the rule is built.

4. Click the rule to copy it and then paste it into the **Define parsing rules** field in the Grok Parser.

    `rule %{ip:network.client.ip} %{notSpace:http.ident:nullIf("-")} %{notSpace:http.auth:nullIf("-")} \[%{date("dd/MMM/yyyy:HH:mm:ss Z"):date}\] "%{word:http.method} %{notSpace:http.url} HTTP\/%{number:http.version}" %{number:http.status_code} %{integer:network.bytes_written} "%{notSpace:http.referer}" "%{data:http.useragent}"`{{copy}}

    Notice that the rule matches the sample.

5. Enter `Using custom rule`{{copy}} for **Name the processor** and click **Save**.

    ![grok-parser](logspipeline/assets/grok-parser.png)

6. In the tab with Log Explorer, close the log details if it is open. Scroll to the top of the list for the most recent logs, and click a recent `flog` log.

    Notice that the **Event Attributes** list is now populated because the Grok Parser is successfully extracting attributes for the logs.

    Use the up and down arrow keys to look at more logs. You'll notice, with a exception of a rare few, the logs are now parsed. (The logs that are exceptions would be interesting to explore to understand why they are not parsed.)

Now that attributes are being parsed from the logs, lets start using other processors like remappers and parsers to further enrich the logs.