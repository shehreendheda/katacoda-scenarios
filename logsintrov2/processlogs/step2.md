Once you've created or cloned a Pipeline, you can add and edit processors to it based on the log processing needs.

Available processors include the following:

- <a href="https://docs.datadoghq.com/logs/processing/parsing" target="_blank">Grok Parser</a>, which can extract attributes from semi-structured text messages

- Several remappers that remaps source attributes to target standard attributes

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#category-processor" target="_blank">Category Processor</a>, which <a href="https://www.datadoghq.com/blog/how-to-categorize-logs/" target="_blank">enrich logs</a> with attributes that categorize them

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#lookup-processor" target="_blank">Lookup Processor</a>, which defines a mapping between a log attribute and a human readable value saved in an Enrichment Table (beta) or the processors mapping table.

Let's create a clone of the **Ruby** pipeline so that you can edit the processors in the pipeline to process the custom Ruby logs being collected from the Storedog app store-frontend service. 

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a>.

2. Now, let's clone the **Ruby** Integration pipeline to create a modified version of this pipeline.

    Hover over the **Ruby** pipeline and click the **Clone** icon that appears on the right. You'll see **Are you sure? Clone Cancel** appear where the icon was. Click **Clone**. You'll see a message appear that the clone pipeline was create and that the **Ruby** pipeline was disable to avoid duplication. 

    Hover over the new **Ruby** pipeline and click the **Edit** icon that appear on the right.

    Under **Filter**, delete `source:ruby` and enter `env:ruby-shop`{{copy}} and `service:store-frontend`{{copy}}.

    Under **Name**, enter `ruby clone for store-frontend`{{copy}}.

    Click **Save** to update the name and filters for the pipeline in the list. 

    ![clone-pipeline](processlogs/assets/clone-pipeline.png)

3. Because the pipelines are applied in the order they appear in the Pipelines list, let's rearrange the pipelines so that all `env:ruby-shop service:store-frontend` logs flow through the new processor and all other `source:ruby` logs would flow through the **Ruby** pipeline.

    Click the six dot icon on the right of the new pipeline and move it above the **Ruby** pipeline.

    Click the enable/disable toggle for the **Ruby** to enable the pipeline (because it was disabled when you cloned the pipeline).

    ![reorder-pipelines](processlogs/assets/reorder-pipelines.gif)

    With this ordering, when `source:ruby` logs flow through the processing pipelines, the logs that also have `env:ruby-shop` and `service:store-frontend` tags are filtered into the **ruby clone for store-frontend** pipeline, while all the logs that do not have these two tags are filtered into the **Ruby** pipeline.

4. Expand the **ruby clone for store-frontend** pipeline to see the list of processors. As logs are filtered into the pipeline, each processor processes the logs in sequential order. 

In the following steps, you'll update and add processors to this pipeline.