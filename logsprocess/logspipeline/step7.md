The final `apache - flog` custom pipeline should look like the following:

![apache-flog-pipeline](logspipeline/assets/apache-flog-pipeline.png)

And the **Event Attributes** listed in the processed logs should look like the following:

![log-final-apache-flog](logspipeline/assets/log-final-apache-flog.png)

Let's install the Apache Integration Pipeline and take a look at its processed logs.

1.  Click the command `flog-with-source-tag`{{execute}} to restart the Docker container for custom apache service with a source tag.

    Adding `--label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]'` when running the Docker container assigns the tags `source:apache` and `service:apache` to the logs. 

    `source` - The attribute that defines which integration is sending the logs. Datadog identifies the log source for the container and automatically uses corresponding integrations, if available. This **Autodiscovery** feature speeds up the setup process for log collection and processing. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

    `service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

    Note: In Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value, which is why the logs so far have the tags `source:flog` and `service:flog`. If the `short_image` tag value matches an Integration name, such as agent, redis, and nginx, it is not necessary to set these values because Datadog's Autodiscovery will recognize the `source` tag value and use the corresponding Integration. Because `flog` is not an Integration name, you have to update the `source` tag using labels to make sure that the Apache Intergration Pipeline is installed and processes the logs.

2. 