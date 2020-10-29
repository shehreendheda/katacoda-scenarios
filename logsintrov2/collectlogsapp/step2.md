To collect logs from the app, <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation" target="_datadog">Log collection</a> has to be enabled for the Datadog Agent so that logs from the Agent container as well as the application services containers can be collected by Datadog.

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}}.

    Let's add the code for enabling trace and log collection.

3. Click **Copy to Editor** in the block below to add the following to the list of environment variables for the `agent`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent env variables">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre> 
    
    `DD_LOGS_ENABLED=true` enables log collection from the agent container. 
    
    `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enable log collection from the all other containers. 
    
    To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation.

4. Click **Copy to Editor** below to add labels to the logs. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "datadog-agent", "service": "agent"}]'</pre>
    
    The `com.datadoghq.ad.logs` label sets the <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">configuration parameters for log collection</a>. 
    
    The log collection parameters that you're configure are `"source": "datadog-agent"` and `"service": "agent"`.

    `source` - The attribute that defines which integration is sending the logs. Datadog identifies the log source for the container and to automatically install corresponding integrations, if available. This **Autodiscovery** feature speeds up the setup process for log collection. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

    `service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

The **agent** section of the docker-compose file should now look like the screenshot below. <p> ![instrumented-agent](collectlogsapp/assets/instrumented-agent.png)

Note: If you want to exclude logs collected from the Datadog Agent, you can add the environment variable `DD_CONTAINER_EXCLUDE="name:datadog-agent"` for the `agent`.

With log collection enabled for the Datadog Agent, let's go through instrumentation of one of the app services.


