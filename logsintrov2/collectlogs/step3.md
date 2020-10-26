For many log sources, log configuration for Datadog involves setting <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">log collection configurations</a> that you usually find in an integration configuration file. 

For a Docker environment, the log collection configuration are assigned using the following label:

```
labels:
    com.datadoghq.ad.logs: '["<LOGS_CONFIG>"]'
```
where <LOGS_CONFIG> are the log collection configuration parameters listed <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">here</a>. 

The log collection parameters that you'll configure for the app services are `source` and `service`.

`source` - The attribute that defines which integration is sending the logs. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

`service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

On the previous page, the some of the logs for the curls commands you sent were grouped under the `root-api` service. These logs belonged to the `api` and `thinker` services. 

Let's add labels to the logs for these services so that they are no longer grouped. Adding the service tag will also separate their spans in the APM traces for the commands.

From Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value for the integrations sources, which is why `redis` and `nginx` had pre-assigned `source` and `service` tags when their integrations were automatically enabled.

In general, for the log sources with integrations, Datadog automatically installs the corresponding integration based on the log source listed in the configurations and overrides any defaults values for parameters based on the configurations.

Let's also update the add labels for the nginx and redis that override either the default `source` or `service` value to see how this affects the log

1. Click `docker-compose.yml`{{open}}.

2. Click **Copy to Editor** to configure the log `source` and `service` tags for the `api` and `thinker` containers.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert api labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-api"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert thinker labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-microservice"}]'</pre>

3. Click **Copy to Editor** to configure the log `source` and `service` tags for the `redis` and `nginx` containers.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert redis labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "redis", "service": "redis"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert nginx labels here">
         com.datadoghq.ad.logs: '[{"source": "nginx", "service": "nginx"}]'</pre>

