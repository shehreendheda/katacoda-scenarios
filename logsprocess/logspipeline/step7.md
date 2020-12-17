The final `apache - flog` custom pipeline should look like the following:

![apache-flog-pipeline](logspipeline/assets/apache-flog-pipeline.png)

And the **Event Attributes** listed in the processed logs should look like the following:

![log-final-apache-flog](logspipeline/assets/log-final-apache-flog.png)

Let's install the Apache Integration Pipeline and take a look at its processed logs.

1.  Click the command `flog-with-source-tag`{{execute}} to restart the Docker container for custom apache service with a source tag.

    Adding `--label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]'` when running the Docker container assigns the tags `source:apache` and `service:apache` to the logs. 

    `source` - The name of the source owning the log. Datadog identifies the log source and automatically uses corresponding the Integration Pipeline, if available. This **Autodiscovery** feature speeds up configuration for log processing. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

    `service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

    Note: In Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value, which is why the flog logs so far have the tags `source:flog` and `service:flog`. If the `short_image` tag value matches an Integration name, such as for the `agent`, it is not necessary to set these values because Datadog's Autodiscovery will recognize the `source` tag value and use the corresponding Integration. Because `flog` is not an Integration name, you have to update the `source` tag using `labels` to make sure that the Apache Intergration Pipeline is installed and is used to process the logs.

2. In the **Logs** browser tab, close the log details if it is open. Scroll to the top of the list for the most recent logs. Clear the search field and enter `env:logspipeline`{{copy}} to make sure you are only seeing logs from this environments.

    ![logs-apache-source](logspipeline/assets/logs-apache-source.png)

    Notice that you are now seeing logs for the `apache` service. Click one of these logs.

    ![log-final-apache-source](logspipeline/assets/log-final-apache-source.png)

    You'll notice that it has a similar list of Event Attributes compared to the list in logs processed with the custom pipeline.

3. In <a href="https://app.datadoghq.com/logs/pipelines" target="_blank">**Logs > Configuration > Pipelines**</a>, notice that the **Apache** pipeline has been automatically installed. 

    ![apache-pipeline-installed](logspipeline/assets/apache-pipeline-installed.png)

    Also, notice that you don't need to disable the **apache - flog** pipeline you created because the filter for that pipeline is `service:flog`, while the filter for the **Apache** pipeline is `source:apache`.

    Expand the **Apache** pipeline to view the processors.

    ![apache-pipeline-processors](logspipeline/assets/apache-pipeline-processors.png)

    Notice that the pipeline has similar processors, with the exception of the <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#log-date-remapper" target="_blank">Date Remapper</a>, which maps the date attribute in the log to the official log date displayed in the upper left of the log details next to the official status. 

4. Hover over the **Grok Parser** and click the **View** (eye) icon that appears. Review the details of the parser to see how it differs from the one you created.

5. Repeat step 4 for the other processors in the list.

Overall, you were able to build a custom apache pipeline that is very similar to the Apache Integration Pipeline. Although, you can use the Integration Pipeline to successfully process logs from the live source, this may not always be the case. You can have custom log sources that do not have a matching Integration Pipeline. Or, you can have custom logs coming from a source that has an Intgeration Pipeline, but the log details don't quite match the Integration Pipelines. In the latter case, you can clone the Integration Pipeline and modify it as needed.

As optional exercises, you can try the following:
* Add a Date Remapper to your custom pipeline. But, remember that you named the date attribute `date` (while it is named `date_access` in the Apache pipeline), so you'll have to remap the attribute `date` to be the official log date.
* Add a <a href="https://app.datadoghq.com/logs/pipelines/standard-attributes" target="_datadog">Standard Attribute</a> for the date attributes that are used for the official log date. <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">Standard attributes</a> help ensure naming consistency throughout your organization.

#### Assessment

To receive a grade for this activity, click `grademe`{{execute}}.

