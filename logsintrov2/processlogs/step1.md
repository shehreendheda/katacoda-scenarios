In Log Configuration, you can add OOTB Integration Pipelines for common log sources and create custom pipelines for custom log sources to process your logs.

<a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> are an ordered set of <a href="https://docs.datadoghq.com/logs/processing/processors/" target="_blank">processors</a> that are applied to a filtered subset of logs (after collection, but before indexing so all logs are processed). The resulting logs have a uniform structure with standard attribute names so that you can use them, along with assigned tags, to build search queries for log data throughout Datadog.

Let's explore the different ways to add/create a Pipeline in Datadog: Adding an Integration Pipeline, creating a new custom pipeline, and cloning an existing pipeline.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Because the log collection by Datadog is set up for the app, you'll see the **Datadog Agent**, **Ruby**, and **python** Integration Pipelines in the Pipelines list.

    Click the **Ruby** pipeline to view its list of processors. Hover over the processors. You'll see the view icon appear on the right. For some of the processors, click the icon to view their details. Note that you cannot edit an Integration Pipeline and its processors.

    Click the pipeline again to collapse its processors list.

    Let's explore more options for Integration Pipelines.

2. In the upper right, click **Browse Pipeline Library** to open the Pipeline Libary side panel. For any one of the pipelines in the library, do the following.

    Click the arrow on the right of the pipeline name to expand the pipeline list and see the list of processors in the pipeline. Hover over each processer, click the view icon that appears on the left to view its details.
    
    Hover of the pipeline name. You'll see different options appear. 
    
    Click **View** to see the pipeline filter query. Click **Close**. 
    
    Click **Clone** to update the filter query and name of of the pipeline clone. Click **Cancel**. If you had clicked **Clone** instead, a modifiable version of the pipeline would appear in the Pipelines list.
    
    Click **Installation Instructions** to view how to install the pipeline. Notice that you are instructed to use the `source: XXX` label. Click **Close** in the **Installation Instructions**. If you have clicked **Integration Documentation** instead, a tab would open for more information about the Integration.

    Click `docker-compose-files/docker-compose-broken.yml`{{open}} in the editor on the right to see that the services have been configured with the `source:xxx` label, which is why the **Datadog Agent**, **Ruby**, and **python** Integration Pipelines have been installed automatically.

    Close the Pipeline Library side panel.

3. Let's now take a look at creating a custom pipeline. 

    In the upper right, click **New Pipeline**. 
    
    Under **Filter**, enter `env:ruby-shop`{{copy}} and `service:store-frontend`{{copy}}. Notice that the logs in the Preview filtered based on this query.

    Under **Name**, enter `ruby - store-frontend`{{copy}}.

    Click **Save**. The new pipeline would have appeared at the bottom in the **Pipelines** list.

    [image]

    Hover over the new pipeline and click the **Delete** icon that appears. In the next step, you'll create a clone of the **Ruby** pipeline using the same search query filter.

5. Now, let's clone the **Ruby** Integration pipeline to create modified this pipeline.

    Hover over the **Ruby** pipeline and click the **Clone** icon that appears on the right. You'll see `Are you sure? **Clone** **Cancel**` appear where the icon was. Click **Clone**. You'll see a message appear that the clone pipeline was create and that the **Ruby** pipeline was disable to avoid duplication. 

    Hover over the new **Ruby** pipeline and click the **Edit** icon that appear on the right.

    Under **Filter**, delete `source:ruby` and enter `env:ruby-shop`{{copy}} and `service:store-frontend`{{copy}}.

    Under **Name**, enter `ruby-shop store-frontend`{{copy}}.

    Click **Save** to update the name and filters for the pipeline in the list. 

6. Because the pipelines are applied in the order they appear in the Pipelines list, let's rearrange the pipeline so that all `env:ruby-shop service:store-frontend` logs flow through the new processor and all other `source:ruby` logs would flow through the **Ruby** pipeline.

    Click the six dot icon on the right of the new pipeline and move it above the **Ruby** pipeline.

    Click the enable/disable toggle for the **Ruby** to enable the pipeline (because it was disabled when you cloned the pipeline).

    With this ordering, when `source:ruby` logs flow through the processing pipelines, the logs that also have `env:ruby-shop` and `service:store-frontend` tags are filtered into the **ruby-shop store-frontend** pipeline, while all the logs that do not have these two tags are filtered into the **Ruby** pipeline.



    

