Datadog automatically parses JSON-formatted logs to extract attributes. For logs with other formats, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> that can be added to <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> to help extract attributes.

1. If you've previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

2. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration > Pipelines**</a>.

3. Click **New Pipeline** in the upper right. 

4. Enter `source:nginx` for **Filter**.

5. Enter `nginx - custom` for **Name**.

6. Click **Save**. A new `nginx - custom` pipeline will appear in the pipelines list.

7. Expand the new pipeline and click **Add Processor**. A pop-up window to create a **New Processor** will open.

8. Under **Select the processor type**, select `Grok Parser`.

9. Leave the **New Processor** window open.

In the following examples, you're going to copy-paste the given log example into the **Log samples** field and the matching parsing rule into the **Define parsing rules** field. Once you enter a log sample and a parsing rule, you'll see that the parser checks if the rule matches the sample.
