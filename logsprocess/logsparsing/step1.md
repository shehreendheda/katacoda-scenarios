Datadog automatically parses JSON-formatted logs to extract attributes. For logs with other formats, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> that can be added to <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> to help extract attributes.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration > Pipelines**</a>.

2. Click **New Pipeline** in the upper right. 

3. Enter `source:nginx` for **Filter**.

4. Enter `nginx - custom` for **Name**.

5. Click **Save**. A new `nginx - custom` pipeline will appear in the pipelines list.

6. Expand the new pipeline and click **Add Processor**. A pop-up window to create a **New Processor** will open.

7. Under **Select the processor type**, select `Grok Parser`.

8. Leave the **New Processor** window open.

In the following examples, you're going to copy-paste the given log example into the **Log samples** field and the matching parsing rule into the **Define parsing rules** field. Once you enter a log sample and a parsing rule, you'll see that the parser checks if the rule matches the sample.
