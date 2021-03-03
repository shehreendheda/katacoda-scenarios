One complication when collecting logs generated from different sources set up by different teams is that the name for the same attribute can vary. For example, the `http.status_code` can be also be named `status_code` or `http_code` or `response_code` or another relevant name. To address this complication, Datadog recommends using <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">standard attributes and aliasing</a> so that all logs from different sources display attributes with the same name convention. 

In addition, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/#standard-attributes-in-log-configuration" target="_blank">Standard Attributes</a> feature that allows you to alias (or remap) a list of source attributes to a destination/standard attribute. You can search, create, and edit the standard attributes shared in a Datadog organization. A benefit of this is that you don't have to add a remapping processer to all custom pipelines that you need to remap the an attribute to. You can create one Standard Attribute that will apply to all pipelines. 

Let's take a look at Standard Attributes in Datadog. 

1. Let's first find an attribute in the store-frontend logs that you can use.

    Navigate to the Log List in <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> and filter the list to the `service:store-frontend` logs.

    Click a `store-frontend` log to view it's attributes list. Use the up and down arrow keys to view different logs. Notice that the attribute `controller` is extracted from the store-frontend logs, so you can use this one.

    ![before-standard](processlogs/assets/before-standard2.png)

2. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/standard-attributes" target="_datadog">**Logs > Configuration > Standard Attributes**</a>.

3. A list of <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">predefined (default) standard attributes</a> is displayed.  
    
    Hover over each attribute and click the **Edit** icon that appears to learn more about these attributes. 

4. In Click **New Standard Attribute** to open the **Add new standard attribute** editor.

    Click the question mark icon next to editor name to learn more about the fields in the editors. 

    Under **Define standard attribute**, enter `controller`, leave **Type** as `string`, and enter **...**.

    Under **(optional) Define attribute(s) to remap**, enter `controller.name`{{copy}}.

    Click **Save**. You'll be redirected to the standard attribute list.

    ![standard-attribute](processlogs/assets/standard-attribute.gif)

6. Navigate to the Log List in <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> and filter the list to the `service:store-frontend` logs.

    There may be a pause in the Log Stream as the new standard attribute is applied. Wait for new **store-frontend** logs appear. 

    Click the new logs to see the attribute `controller` has been replaced by the attribute `controller.name`.

    ![after-standard](processlogs/assets/after-standard2.png)

7. Go back to the tab with the standard attributes list. 

    Hover over the `controller.name` attribute and click the **Delete** icon that appears (to clean up your account for future labs).
