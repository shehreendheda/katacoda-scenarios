Grok Parsers in OOTB Integration Pipelines, Parse My Logs, and Patterns are great features to help you get started with parsing your logs. 

1. In the terminal on the right, an app with an Nginx webserver is being brought online. When the output in the terminal looks like that in the image, move onto the next step.

    ![nginx_ready](logsparsing/assets/nginx_ready.gif)

2. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a>. 

    The Logs List should still be filtered by `env:logparsing` so that you are only seeing logs for the app environment. Enter `env:logparsing`{{copy}} in the search field if it is not listed.

3. Filter the Log List by entering `source:nginx` in the search field above the list or by selecting `nginx` under **Sources** in the **Facets** list on the left of the Log List.

4. Click one of the **nginx** logs.

    ![nginx-ip-processed](logsparsing/assets/nginx-ip-processed.png)

    Notice the list of **Event Attributes**. The log message below the **ALL TAGS** list is processed into these attributes because of the Nginx Integration Pipeline that is automically installed and used to process logs from the Nginx source.

5. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration**</a>.

    Notice the **Nginx** pipeline in the **Pipelines** list. When an Nginx log is collected it is processed by the **Nginx** pipeline.

6. Expand the **Nginx** pipeline.

    ![nginx-ip](logsparsing/assets/nginx-ip.png)

    The first processor in the list is a **Grok Parser**. When an Nginx log is filtered into the pipeline, it is first processed by the parser and its individual attributes are extracted. 

7. Hover over the Grok Parser, then click the View (eye) icon that appears on the right of the parser to open the **View Grok Parser** window.

    Look over the **Log samples** and the rules in **Define parsing rules**. Notice that the `access_combined` rule includes the `access.common` rule. Not only can you use helper rules in parsing rules, but you can also use any preceding rule in a rule. (The order of the rules matters!) 

    Click **Advanced Settings** to view the helper rules.

    Click each log in the **Log samples** to view the extracted attributes below the rules and to see which parsing rule is being used for which log sample.

    Close the Grok Parser window.

8. On the right of the **Nginx**  pipeline, click the toggle switch to disable the pipeline.

    On the right of the **nginx - custom**  pipeline, click the toggle switch to enable the pipeline.

    ![nginx-toggled](logsparsing/assets/nginx-toggled.png)

9. Expand the **nginx - custom** pipeline and click **Add Processor**.

    Under **Select the processor type**, select `Grok Parser`.

    Click the **Parse My Logs** button that appears below the processor type.

    Notice the **Log samples** and **Define parsing rules** fields fill up. Look closely at the log samples and parsing rules, they don't necessarily match the ones in the Nginx Integration Pipeline. That's alright. In fact, that's the purpose of being able to create unique parsing rules because even common tools like Nginx can be configured to produce logs with custom formats and structures that require custom parsing rules.

    When you click each log sample, notice the **Need Help?** link under the **Match** (or **No Match**) label. You can click this link any time to get direct help from Datadog Support to parse the log.
    
   **Parse My Logs** is a "magic" parsing tool that adds the most common log patterns (that match the pipeline filter query) as log samples and their matching parsing rules to the Grok Parser.

10. Click the question mark next to **Parse My Logs**. 

    In the message that appears, click the **logs patterns** link to open a new tab for the <a href="https://app.datadoghq.com/logs/patterns" target="_datadog">**Logs > Patterns**</a> view.

    The <a href="https://docs.datadoghq.com/logs/explorer/patterns/" target="_blank">Patterns</a> view lists the most frequent log patterns based on the search context (time range and search query). 

    Notice that the Patterns list is filtered on `source:nginx`. This is because you navigated to the page using the link from the Grok Parser in a pipeline for `source:nginx` logs.

    Also, notice that the patterns listed match the log samples that appeared in the Grok Parser after you clicked **Parse My Logs**. 

11. Click one of the patterns. You'll see details about the patterns and a list of corresponding logs for the pattern.

    Click **Show parsing rule** near the top of the pattern. This is one of the parsing rules that was listed in the Grok Parser after you clicked **Parse My Logs**.

    Close the pattern detail panel.

12. Click the icon for **Search** on the left of the Logs search field. ![logs-search](logsparsing/assets/logs-search.png) 

    Click one of the **nginx** logs.

    ![nginx-unprocessed](logsparsing/assets/nginx-unprocessed.png)

    Notice there is no list of **Event Attributes**. Instead, there is message to help you get started with processing your logs from this source. Remember, the **Nginx** Integration Pipeline is disabled and there is no processor saved in the **nginx - custom** pipeline.  

    In the browser tab that your are creating the Grok Parser, enter `Parsing nginx logs for webapp`{{copy}} in the **Name the Processor** field and click **Save**.

    In the tab that you are viewing the Logs List, wait a few seconds then click a new **nginx** log. 

    ![nginx-custom-processed](logsparsing/assets/nginx-custom-processed.png)

    Notice that the **Event Attributes** are now listed. Compared to the logs processed by the Nginx Integration Pipeline, this list of Event Attributes is simple. This is because the pipeline that processed this log has only the Grok Parser while the Integration Pipeline also includes other processors that further process the attributes extracted by the Grok Parser. Extracting attributes from the log message is usually a first step in log processing.

13. Click the **Terminal 2** tab on the right. Then, click this command `grademe`{{execute}} to receive credit for creating the **nginx - custom** pipeline.

14. In the browser tab with the Pipelines list, hover over the **nginx - custom**  pipeline. Click the toggle switch to disable the pipeline or click the trash icon to delete the pipeline.

    On the right of the **Nginx** pipeline, click the toggle switch to enable the pipeline. If another lab on learn.datadoghq.com uses the **Nginx** Integration Pipeline, this will make sure that this pipeline is enabled and used for processing the logs in that lab.  

In general, Datadog provides these automatic parsing features to help you get started with Grok parsing your logs. If needed, you can modify the log samples and parsing rules created from these features to account for all possible log patterns from your log source.