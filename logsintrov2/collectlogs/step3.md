For many log sources, log configuration for Datadog involves setting <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">log collection configurations</a> that you usually find in an integration configuration file. 

For a Docker environment, the log collection configuration are assigned using the following label, where <LOGS_CONFIG> are the log collection configuration parameters listed <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">here</a>:

```
labels:
    com.datadoghq.ad.logs: '["<LOGS_CONFIG>"]'
```

The log collection parameters that you'll configure for the app services are `source` and `service`.

`source` - The attribute that defines which integration is sending the logs. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

`service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

On the previous page, the some of the logs for the curls commands you sent were grouped under the `root-api` service. These logs belonged to the `thinker-api` and `thinker-microservice` sources. Let's add labels to their logs so that they are clearly named. 

1. Click `docker-compose.yml`{{open}}.

2. Click **Copy to Editor** to configure the log `source` and `service` tags for the `api` and `thinker` containers.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert api labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-api"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert thinker labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-microservice"}]'</pre>

    Let's restart the Docker environment so that they labels are applied to the logs for these services.

3. In the terminal on the right, enter **CTRL-C** to stop the process. Then, click the command `docker-compose stop && docker-compose rm -f && docker-compose up --build`{{execute}} to restart the Docker environment.

     When the output in the terminal looks like the following image, the environment is ready and you can continue.

     ![env-online](collectlogs/assets/env-online.gif)

4. Click the **Terminal 2** tab. Then, click each of these commands to run them in the terminal.

    `curl -X GET 'http://localhost:8080/think/?subject=technology'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=religion'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=war'`{{execute T2}}
    
    `curl -X GET 'http://localhost:8080/think/?subject=work'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=music'`{{execute T2}}

5. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>.

    Notice that there the logs for the `thinker-api` and `thinker-microservice` services are clearly labeled and that the Service list under Facets lists these services as options. 

6. Click a log for `thinker-api` and a log for `thinker-microservice` to see its details. 

    Example of `thinker-api` log.
    ![thinker-api-log](collectlogs/assets/thinker-api-log.png)

    Notice that the `service` and `source` tiles in the log details list the respectice service name `thinker-api` or `thinker-microservice` and the source name `webapp` for each. 
    
    Note: The logs for these services are still not processed (because of no processing pipeline) so there are no **Event Attributes**. The next step for log management for these logs would be to create a custom pipeline to process the logs, which you won't complete in this activity. You'll learn more about pipelines in a later activity.

    Note: From Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value for log sources with integrations, which is why `redis` and `nginx` had pre-assigned `source` and `service` tags when their integrations were automatically enabled. If custom log collection configurations are provided for these sources, Datadog installs Integrations corresponding to the log source listed in the configuration and overrides any defaults values for parameters based on the configurations.

Now that logs from the Flask application services are being collected. Let's explore how the logs are correlated to metrics and traces throughout Datadog.

