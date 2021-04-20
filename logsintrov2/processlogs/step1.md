In Logs Configuration, you can add OOTB Integration Pipelines for common log sources and create custom pipelines for custom log sources to process your logs.

<a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> are an ordered set of <a href="https://docs.datadoghq.com/logs/processing/processors/" target="_blank">processors</a> that are applied to a filtered subset of logs (after collection, but before indexing so all logs are processed). The resulting logs have a uniform structure and attribute with standard naming convention so that you can use the attributes, along with assigned tags, to build search queries for log data throughout Datadog.

Let's explore the different ways to add/create a Pipeline in Datadog: Adding an Integration Pipeline, creating a new custom pipeline, and cloning an existing pipeline.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Because the log collection by Datadog is set up for the Storedog app, you'll see the **Datadog Agent**, **Ruby**, and **python** Integration Pipelines in the Pipelines list.

    Click the **Ruby** pipeline to view its list of processors. Hover over the processors. You'll see the view icon appear on the right. For some of the processors, click the icon to view their details. Note that you cannot edit an Integration Pipeline and its processors.

    Click the pipeline again to collapse its processors list.

    Let's explore more options for Integration Pipelines.

2. In the upper right, click **Browse Pipeline Library** to open the Pipeline Libary side panel. For any one of the pipelines in the library, do the following.

    Click the arrow on the left of the pipeline name to expand the pipeline list and see the list of processors in the pipeline. Hover over each processer, click the view icon that appears on the left to view its details.
    
    Hover of the pipeline name. You'll see different options appear. 
    
    Click **View** to see the pipeline filter query. Click **Close**. 
    
    Click **Clone** to view and update the filter query and name of the pipeline clone. Click **Cancel**. If you had clicked **Clone** instead, a customizable version of the pipeline would be added to the Pipelines list. 
    
    Click **Installation Instructions** to view how to install the pipeline. Notice that you are instructed to use the `source: XXX` label. Click **Close** in the **Installation Instructions**. If you had clicked **Integration Documentation** instead, a tab would open to the Datadog documentation for Integrations.

    To manually add an Integration Pipeline to the Pipelines list, use the **Clone** option, and to automatically add an Integration Pipeline to the Pipelines list, follow the **Installation Instructions** option
    
    Close the Pipeline Library side panel.

    ![pipeline-library](processlogs/assets/pipeline-library.gif)

    Click `/deploy/docker-compose/docker-compose-broken.yml`{{open}} to view the file in the editor on the right. Notice that the services have been configured with the `source:xxx` label, which is why the **Datadog Agent**, **Ruby**, and **python** Integration Pipelines have been installed automatically.

3. Let's now take a look at creating a custom pipeline. 

    In the upper right, click **New Pipeline**. 
    
    Under **Filter**, enter `env:ruby-shop`{{copy}} and `service:store-frontend`{{copy}}. Notice that the logs in the Preview are filtered based on this query.

    Click **Cancel**. You don't need to create a new pipeline now. If you were going to create the pipeline, you would have entered a descriptive name and clicked Save.

    ![create-new-pipeline](processlogs/assets/create-new-pipeline.png)

Next, you'll create a clone of the **Ruby** pipeline so that you can edit the processors in the pipeline.
