Datadog automatically parses JSON-formatted logs to extract attributes. For logs with other formats, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> that can be added to <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> to help extract attributes. Let's take a look at the Grok Parser.

The lab environment for this activity is being prepared in the terminal on the right. When the environment is ready, you will see the message `Provisioning Complete` in the terminal along with your Datadog login credentials.

1. In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a>.

    If you see the Logs List, enter `env:logparsing`{{copy}} into the search field to see logs from this lab environment. Move on to the next step. 

    If you see the Getting Started prompt, you need to first enable Logs before you can continue. Click **Getting Started**, then click **Getting Started** again. If you see the Logs List, enter `env:logparsing`{{copy}} into the search field to see logs from this lab environment. Move on to the next step.
    
    If you don't see the Logs List, wait a minute or so while Datadog's Autodiscovery feature detects that logs are being collected in the organization. Try navigating to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> again. You may need to repeat until you see the Logs List. When you see the Logs List, enter `env:logparsing`{{copy}} into the search field to see logs from this lab environment. Move on to the next step.

3. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration**</a>.

4. Click **New Pipeline** in the upper right. 

    Enter `source:nginx`{{copy}} for **Filter**. Note: The list of logs in the New Pipeline window will disappear if logs with the `source:nginx` tag were not recently collected in the Datadog organization. That's expected.  

    Enter `nginx - custom`{{copy}} for **Name**.

    Click **Save**. A new `nginx - custom` pipeline will appear in the Pipelines list.

5. Expand the new pipeline and click **Add Processor**. A pop-up window to create a **New Processor** will open.

6. Under **Select the processor type**, select `Grok Parser`.

7. Leave the **New Processor** window open.

For the following examples, you're going to copy and paste the given log sample into the **Log samples** field and the corresponding parsing rule into the **Define parsing rules** field. Once you enter a log sample and a parsing rule, you'll see that the parser checks if the rule matches the sample.
