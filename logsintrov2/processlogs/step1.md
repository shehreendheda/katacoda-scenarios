In Log Configuration, you can add OOTB Integration Pipelines for common log sources and create custom pipelines for custom log sources to process your logs.

<a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> are an ordered set of <a href="https://docs.datadoghq.com/logs/processing/processors/" target="_blank">processors</a> that are applied to a filtered subset of ingested logs. The resulting logs have a uniform structure with standard attribute names so that you can use them, along with assigned tags, to build search queries for logs data throughout Datadog.

Let's explore the different ways to add/create a Pipeline in Datadog: Adding an Integration Pipeline, creating a new custom pipeline, and cloning an existing pipeline.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Because the log collection by Datadog is set up for the app, you'll see the **Datadog Agent**, **Ruby**, and **python** Integration Pipelines in the Pipelines list.

    Let's explore more options for Integration Pipelines.

2. In the upper right, click **Browse Pipeline Library**. 

    Hover of the different pipelines. You'll see different options appear. For any of the pipelines, do the following.
    
    Click **View** to see the pipeline filter query. Click **Close**. 
    
    Click **Clone** to update the filter query and name of of the pipeline clone. Click **Cancel**. If you had clicked **Clone** instead, a modifiable version of the pipeline would appear in the Pipelines list.
    
    Click **Installation Instructions** to view how to install the pipeline. Click **Close**. If you have clicked **Integration Documentation** instead, a tab would open for more information about the Integration.

    Close the Pipeline Library.

3. Let's now take a look at creating a custom pipeline. 

    In the upper right, click **New Pipeline**. 
    
    Under **Filter**, enter `env:ruby-shop`{{copy}} and `service:store-frontend`{{copy}}. Notice that the logs in the Preview filtered based on this query.

    Under **Name**, enter `ruby - store-frontend`{{copy}}.

    Click **Save**. The new pipeline will appear at the bottom in the Pipelines list. 

    [image]

4. Because the pipelines are applied in the order they appear in the Pipelines list, the `store-frontend` logs are currently being processed by the Ruby Integration Pipeline. Let's move the new pipeline above this integration pipeline. 

    On the right of the **ruby - store-frontend** pipeline, click the six dots icon and drag the index above the **Ruby** pipeline.

    Now the `store-frontend` logs will be filtered and processed through **ruby - store-frontend** pipeline instead of the **Ruby** pipeline.

5. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a>. 

    You may notice that there is a pause in the log stream while the new pipeline is being applied. When new logs start coming in, click a new **service:store-frontend** log.

    

Expand the pipeline in the list and click Add Processor. add the Processors you need to the pipeline so that you   


Pipelines are applied in the order they appear in the Pipelines list and processors are applied in the order they appear in a pipeline. Keep this in mind as you create and order your pipelines and processors.
