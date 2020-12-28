In the terminal on the right, the Datadog Agent and a custom Apache service are being brought online in a Docker environment. When the environment is ready, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials. 

Let's log in to Datadog to see the logs that are being collected by the Datadog Agent for the Apache service and create a <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">pipeline</a> to process the logs.

1. In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a>.

    ![logs-raw](logspipeline/assets/logs-raw2.png)

    If you see the Logs List, enter `env:logpipeline`{{copy}} into the search field to see logs from this lab environment. Move on to the next step. 

    If you see the Getting Started prompt, you need to first enable Logs before you can continue. Click **Getting Started**, then click **Getting Started** again. If you see the Logs List, enter `env:logpipeline`{{copy}} into the search field to see logs from this lab environment. Move on to the next step.
    
    If you don't see the Logs List, wait a minute or so while Datadog's Autodiscovery feature detects that logs are being collected in the organization. Try navigating to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> again. You may need to repeat until you see the Logs List. When you see the Logs List, enter `env:logpipeline`{{copy}} into the search field to see logs from this lab environment. Move on to the next step.

3. Click one of the **flog** logs to view the log's details.

    ![raw-details](logspipeline/assets/raw-details.png)

    Notice that the `service` and `source` tag values are `flog`. 

    Notice also that there are no Event Attributes listed. Instead, there is message to help you get started with processing your logs.

    Use the up/down arrow keys on your keyboard to view details for more logs in the list. Notice that no log is processed. Also, notice that the log message (text in gray box) in each log has a similar structure. (You'll look more closely at this on the next page.)
    
    Close the log details panel.

4. In the list of facets on the left, browse and see what facets are available. 

    As you add processors to the pipeline later in the activity, you'll see what facets become available. And, if some facets are not available, you'll learn how to add them. 

5. Open <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a> in a new browser tab.

    You'll want to keep the **Logs** browser tab open so that you can see how the log details are processed by each processor you add to the pipeline.

6. Click **New Pipeline** in the upper right to create the new pipeline.

    Enter `service:flog`{{copy}} as the **Filter**.

    Enter `apache - flog`{{copy}} as the **Name**.

    Click **Save**.

    ![create-flog-pipeline](logspipeline/assets/create-flog-pipeline.png)

    ![example-pipelines-list](logspipeline/assets/example-pipelines-list.png)

Let's start adding processors to the pipeline so that the logs for `service:flog` start getting processed.