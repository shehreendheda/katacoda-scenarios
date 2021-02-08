One complication when collecting logs generated from different sources set up by different teams is that the name for the same attribute can vary. For example, the `http.status_code` can be also be named `status_code` or `http_code` or `response_code` or another relevant name. To address this complication, Datadog recommends using <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">standard attributes and aliasing</a> so that all logs from different sources display attributes with the same name convention. 

In addition, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/#standard-attributes-in-log-configuration" target="_blank">Standard Attributes</a> feature that allows you to alias (or remap) a list of source attributes to a destination/standard attribute. You can search, create, and edit the standard attributes shared in a Datadog organization. A benefit of this is that you don't have to add a remapping processer to all custom pipelines that you need to remap the an attribute to. You can create one Standard Attribute that will apply to all pipelines. 

Let's take a look at Standard Attributes in Datadog. 

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/standard-attributes" target="_datadog">**Logs > Configuration > Standard Attributes**</a>.

2. A list of <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">predefined (default) standard attributes</a> is displayed.  
    
    Hover over each attribute and click the **Edit** icon that appears to learn more about these attributes.

3. Let's create a new standard attribute. You can browse the Log List in <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> to get ideas for an attribute to use.

    The attribute `process.name` is extracted from the advertisements-service and discounts-service logs, so you can use this one.

    [image]

4. Click **New Standard Attribute** to open the **Add new standard attribute** editor.

    Click the question mark icon next to editor name to learn more about the fields in the editors. 

    Under **Define standard attribute**, enter `process`, leave **Type** as `string`, and enter **...**.

    Under **(optional) Define attribute(s) to remap**, enter `process.name`{{copy}}.

    Click **Save**. You'll be redirected to the standard attribute list.

    [image]

5. In the **Filter Attributes** field, enter `process` to find the new standard attribute.

    Hover over the attribute and click the **View in Explorer** icon that appears. A new tab will open for <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> with the Log List filtered to the attributes `process:*` and `process.name:*`

    [gif]

    Add `service:advertisements-service`{{copy}} and `service:discounts-service`{{copy}} to the search field so that you are only viewing logs from these services

6. There may be a pause in the Log Stream as the new standard attribute is applied. Wait for new advertisements-service and discounts-service logs appear. 

    Click the new logs to see the attribute `process.name` no longer appears in the logs. Instead, the attribute `process` appears because `process.name` attributes are now remapped to `process`.

7. Go back to the tab with the standard attributes list. 

    Hover over the `process` attribute and click the **Delete** icon that appears (to clean up your account for future labs).

