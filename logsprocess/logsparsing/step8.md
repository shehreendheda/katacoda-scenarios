Grok Parsers in OOTB Integration Pipelines, Parse My Logs, and Patterns are great features to help you get started with parsing your logs for the variety of logs collected from your infrastructure and applications. 

1. In the terminal on the right, an app with an nginx webserver is being brought online. When the output in the terminal looks like that in the image, move onto the next step.

    ![nginx_ready](logsparsing/assets/nginx_ready.gif)

2. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>.

    You can see logs for the app in the Log List. 

3. Filter the Log List by entering `source:nginx` in the search field above the list or by selecting `nginx` under **Sources** in the **Facets** list on the left of the Log List.

4. Click an of the nginx logs.

    Notice the list of **Event Attributes**. The log message below the **ALL TAGS** list is processed in these attributes because of the OOTB nginx Integration and Integration Pipeline that are automically installed and used to collected and process logs from the nginx source.

5. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Notice the **Nginx** pipeline in the **Pipelines** list. When an nginx log is collected it is processed by the **Nginx** pipeline.

6. Expand the **Nginx** pipline.

    Notice that the first processor in the list is a **Grok Parser**. When an nginx log is filtered into the Nginx pipeline, it is first processed by the parser and its individual attributes are extracted. 

7. Hover over the Grok Parser, then click the eye icon that appears on the right for the parser to open the **View Grok Parser** window.

    Look over the **Log samples** and the rules in **Define parsing rules**. Notice that the `access_combined` rule includes the `access.common` rule. So, not only can you use helper rules in parsing rules, you can use any rule listed above another rule in the list. (The order of the rules matters!) 

    Click **Advanced Settings** to view the helper rules.

    Click each log in the **Log samples** to view the extracted attributes below the rules and to see which parsing rule is being used for which log sample.

    Close the Grok Parser window.

8. Hover over the **Nginx** pipline title. On the right of the Nginx pipeline, click the toggle switch to disable the pipeline.

9. Open the <a href="https://app.datadoghq.com/logs" target="_blank">**Log Explorer**</a> in a new tab and filter the list for `source:nginx`.

    Notice that new nginx logs that are not processed because you turned off the pipeline.

10. In the tab with **Logs > Configuration > Pipelines**</a>, click the blue toggle button on the right of the **Nginx** pipline to disable it.

11. Click the blue toggle button on the right of the **nginx - custom** pipline to enable it.

    ![nginx_toggled](logsparsing/assets/nginx_toggled.png)

11. Expand the **nginx - custom** pipeline and click **Add Processor**.

12. Under **Select the processor type**, select `Grok Parser`.

13. Click **Parse My Logs**.

    Notice the **Log samples** and **Define parsing rules** fields fill up. Looking closely at the log samples and parsing rules, they don't necessarily match the ones in the OOTB Integration Pipeline. That's alright. In fact, that's the purpose of having the ability to create unique parsing rules because even common tools like nginx can be configured to produce logs with custom formats and structures that require custom parsing rules.
    
    **Parse My Logs** is a "magic" parsing tool that looks at logs that are filtered through the pipeline and determines the most common logs patterns and creates matching parsing rules.

14. Click the questiom mark next to **Parse My Logs**. 

15. In the message that appears, click the **logs patterns** hyperlink to open a new tab for the **Logs Explorer > Patterns** view.

    The <a href="https://docs.datadoghq.com/logs/explorer/patterns/" target="_blank">Patterns</a> view lists the most frequent log patterns based on the search contenxt (time range and search query). 

    Notice that the Patterns list is filtered on `source:nginx`. This is because you navigated to the page using the link from the Grok Parser in a pipeline for `source:nginx` logs.

    Also, notice that the patterns listed match the log samples that appeared in the Grok Parser after you clicked **Parse My Logs**. 

16. Click one of the patterns. You'll see details about the patterns and a list of corresponding logs for the pattern.

17. Click **Show parsing rule** near the top of the pattern. This is one of the parsing rules that was listed in the Grok Parser after you clicked **Parse My Logs**.

Datadog provides these automatic parsing features to help you get started with Grok parsing. If needed, you can then expand on the log samples/patterns and parsing rules that are created from these features to account for all possible log patterns of your infrastructure and applications.

