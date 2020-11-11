In the terminal on the right, the Datadog Agent and a custom apache log service have been brought online in a Docker environment. 

Let's login to Datadog to see the logs that are being collected by the Datadog Agent for the apache log source.

1. If you've previously used **Logs** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

2. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>.

    In the search field above the log list, enter `env:logspipeline`{{copy}} to make sure you are only seeing logs from this environments. 

    ![logs-raw](logspipeline/assets/logs-raw.png)

3. Click one of the `flog` logs to view the log's details.

    ![raw-details](logspipeline/assets/raw-details.png)

    Notice that the `service` and `source` tags are `flog`.

    Notice also that the Event Attributes listed. Instead, there is message to help you get started with processing your logs.

    Use the up/down arrow keys on your keyboard to view details for more logs in the list. Notice that no log is processed.
    
    Close the log's details panel.

    Let's create a custom <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">pipeline</a> to process the logs.

4. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a> in a new browser tab. 

    You'll want to keep the Log Explorer tab open so that you can see how the logs details are processed by each processor you add to the pipeline.

5. Click **New Pipeline** to create the new pipeline.

    Enter `service:flog`{{copy}} as the **Filter**.

    Enter `apache - flog`{{copy}} as the **Name**.

    ![create-flog-pipeline](logspipeline/assets/create-flog-pipeline.png)