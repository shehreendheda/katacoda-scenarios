For APM in Datadog, you need to enable trace collection by the Datadog agent. To use the added feature of correlating trace and log data, you will also need to enable log collection. 

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}}.

2. Under **services** (**Line 2**), view the details for **agent**. <p> Let's add the code for enabling trace and log collection.

3. Click **Copy to Editor** in the block below to add the following to the list of environment variables for the agent.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent env variables">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre> 
    
    `DD_LOGS_ENABLED=true` enables log collection from the agent container. 
    
    `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enable log collection from the all other containers. 
    
    To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#optional-collection-agents" target="_blank">Tracing Docker Applications</a> and <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation.

4. Click **Copy to Editor** below to add labels to the logs. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add agent log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "datadog-agent", "service": "agent"}]'</pre>
    
    The labels allow Datadog to identify the log source for the container and to automatically install corresponding integrations, if available. This **Autodiscovery** feature speeds up the setup process for log collection. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation. 

The **agent** section of the docker-compose file should now look like the screenshot below. <p> ![instrumented-agent](collectlogsapp/assets/instrumented-agent.png)

With trace and log collection enabled for the Datadog Agent, let's go through instrumentation of one of the app services.
