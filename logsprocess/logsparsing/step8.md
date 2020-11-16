Grok Parsers in OOTB Integration Pipelines, Parse My Logs, and Patterns are great features to help you get started with parsing your logs for the variety of logs collected from your infrastructure and applications. 

1. In the terminal on the right, an app with an nginx webserver is being brought online. When the output in the terminal looks like that in the image, move onto the next step.

    ![nginx_ready](logsparsing/assets/nginx_ready.gif)

2. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>.

    You can see logs for the app in the Log List. 

3. Filter the Log List by entering `source:nginx` in the search field above the list or by selecting `nginx` under **Sources** in the **Facets** list on the left of the Log List.

4. Click one of the nginx logs.

    ![nginx-ip-processed](logsparsing/assets/nginx-ip-processed.png)

    Notice the list of **Event Attributes**. The log message below the **ALL TAGS** list is processed in these attributes because of the OOTB nginx Integration and Integration Pipeline that are automically installed and used to collected and process logs from the nginx source.

5. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Notice the **Nginx** pipeline in the **Pipelines** list. When an nginx log is collected it is processed by the **Nginx** pipeline.

6. Expand the **Nginx** pipeline.

    ![nginx-ip](logsparsing/assets/nginx-ip.png)

    Notice that the first processor in the list is a **Grok Parser**. When an nginx log is filtered into the Nginx pipeline, it is first processed by the parser and its individual attributes are extracted. 

7. Hover over the Grok Parser, then click the eye icon that appears on the right for the parser to open the **View Grok Parser** window.

    Look over the **Log samples** and the rules in **Define parsing rules**. Notice that the `access_combined` rule includes the `access.common` rule. So, not only can you use helper rules in parsing rules, you can use any rule listed above another rule in the list. (The order of the rules matters!) 

    Click **Advanced Settings** to view the helper rules.

    Click each log in the **Log samples** to view the extracted attributes below the rules and to see which parsing rule is being used for which log sample.

    Close the Grok Parser window.

8. Hover over the **Nginx** pipline title. On the right of the Nginx pipeline, click the toggle switch to disable the pipeline.

    Hover over the **nginx - custom** pipline title. On the right of the Nginx pipeline, click the toggle switch to enable the pipeline.

    ![nginx-toggled](logsparsing/assets/nginx-toggled.png)

9. Expand the **nginx - custom** pipeline and click **Add Processor**.

    Under **Select the processor type**, select `Grok Parser`.

    Click **Parse My Logs**.

    Notice the **Log samples** and **Define parsing rules** fields fill up. Look closely at the log samples and parsing rules, they don't necessarily match the ones in the OOTB Integration Pipeline. That's alright. In fact, that's the purpose of being able to create unique parsing rules because even common tools like nginx can be configured to produce logs with custom formats and structures that require custom parsing rules.

    When you click each log sample, notice the **Need Help?** link under the **Match** label. You can click this link any time to get direct help from a Datadog Support Engineer to parse the log.
    
    **Parse My Logs** is a "magic" parsing tool that looks at logs that are filtered through the pipeline and determines the most common logs patterns and creates matching parsing rules.

    Click the questiom mark next to **Parse My Logs**. 

10. In the message that appears, click the **logs patterns** link to open a new tab for the **Logs Explorer > Patterns** view.

    The <a href="https://docs.datadoghq.com/logs/explorer/patterns/" target="_blank">Patterns</a> view lists the most frequent log patterns based on the search contenxt (time range and search query). 

    Notice that the Patterns list is filtered on `source:nginx`. This is because you navigated to the page using the link from the Grok Parser in a pipeline for `source:nginx` logs.

    Also, notice that the patterns listed match the log samples that appeared in the Grok Parser after you clicked **Parse My Logs**. 

11. Click one of the patterns. You'll see details about the patterns and a list of corresponding logs for the pattern.

    Click **Show parsing rule** near the top of the pattern. This is one of the parsing rules that was listed in the Grok Parser after you clicked **Parse My Logs**.

    Close the pattern detail panel.

12. Click the icon for **Search** on the left of the Log Explorer search field, and click one of the nginx logs.

    ![nginx-unprocessed](logsparsing/assets/nginx-unprocessed.png)

    Notice there is no list of **Event Attributes**. Instead, there is message to help you get started with processing your logs from this source. Remember, the **Nginx** Integration Pipeline is disabled and there is no processor saved in the **nginx - custom** pipeline.  

    In the tab that you are creating the Grok Parser, enter `Parsing nginx logs for webapp`{{copy}} in the **Name the Processor** field and click **Save**.

    In the tab with the Log Explorer, wait a few seconds then click a new log. 

    ![nginx-custom-processed](logsparsing/assets/nginx-custom-processed.png)

    Notice that the **Event Attributes** are now listed. Compared to the logs processed by the Nginx Integration Pipeline, this list of Event Attributes is simple. The pipeline that processed this logs had only one processer---the Grok Parser, while the Integration Pipeline includes other processors in addition to a Grok Parser.


Datadog provides these automatic parsing features to help you get started with Grok parsing. If needed, you can then expand on the log samples/patterns and parsing rules that are created from these features to account for all possible log patterns of your infrastructure and applications.

