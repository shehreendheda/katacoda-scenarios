To collect logs from the app, <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation" target="_datadog">Log collection</a> has to be enabled through the Datadog Agent so that logs from the application service containers, as well as the Agent container (if desired), can be collected by Datadog. You can also set specific log collection configuration parameters for the agent.

1. Click `deploy/docker-compose/docker-compose-fixed.yml`{{open}}.

    Let's first enable log collection through the Datadog Agent.

3. Click **Copy to Editor** in the block below to add the following to the list of environment variables under `agent`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent env variables">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre> 
    
    `DD_LOGS_ENABLED=true` enables log collection from the agent container. 
    
    `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enable log collection from the all other containers. 
    
    To learn more about the environment variables and volume mounts for log collection from Docker environments, you can view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation.

    Now, let's also specify certain log collection configuration parameters for the agent.

4. Click **Copy to Editor** below to add the following logs configuration label under `agent`. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "agent", "service": "agent"}]'</pre>
    
    The `com.datadoghq.ad.logs` label sets the <a href="https://docs.datadoghq.com/agent/logs/?tab=tailfiles#custom-log-collection" target="_blank">configuration parameters for log collection</a>. Here, you're specifying the `source` and `service` tags for the agent logs. 

    `source` - The attribute that defines which integration is sending the logs. Datadog identifies the log source for the container and automatically uses corresponding integrations, if available. This **Autodiscovery** feature speeds up the setup process for log collection and processing. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation. If the logs do not come from an existing integration, then this field may include a custom source name. However, it is recommended that you match this value to the namespace of any related custom metrics you are collecting, for example: `myapp` from `myapp.request.count`.

    `service` - The name of the service owning the log. If you instrumented your service with <a href="https://docs.datadoghq.com/tracing/" target="_blank">Datadog APM</a>, this must be the same service name. Check the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging" target="_blank">unified service tagging</a> instructions when configuring `service` across multiple data types.

    Note: In Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value. If the `short_image` tag value matches an Integration name, such as for the Agent, Redis, and Nginx, it is not necessary to set these values because Autodiscovery will recognize the tag value and use the corresponding Integration. (In essence, this step was not necessary here because you're running Agent 7.21.1, but this step will be necessary for the Storedog application services.)

The **agent** section of the docker-compose file should now look like the screenshot below. 

![instrumented-agent](collectlogsapp2/assets/instrumented-agent.png)

With log collection enabled for the Datadog Agent and for all containers, let's configure the `store-frontend` service of the Storedog app.
