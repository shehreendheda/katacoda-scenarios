For APM in Datadog, you need to enable trace collection by the Datadog agent. To use the added feature of correlating trace and related log data, you will also need to enable log collection. (Note: APM is enabled by default for Agent 6+, so enabling here will just be for practice.) 

1.  Click `docker-compose.yml`{{open}} to view the file in the editor on the right. <p> The `docker-compose.yml` instruments the Datadog agent and app services for monitoring with Datadog. 
2. Under **services** (**Line 2**), view the details for the **agent** (**Line 3**). <p> Let's add the code for enabling trace and log collection.
3. Below **Line 8**, add a line break and copy/paste the following to the list of environment variables. Make sure the new lines (**Lines 9-11**) have the same indent as **Line 8**. <p> `DD_APM_ENABLED=true` enables trace collection. <p> `DD_LOGS_ENABLED=true` enables log collection from the agent container. <p> `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enable log collection from the all other containers. <p> To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#optional-collection-agents" target="_blank">Tracing Docker Applications</a> and <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation.
```
      - DD_APM_ENABLED=true
      - DD_LOGS_ENABLED=true
      - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
```{{copy}}
4. Below the **environments** list, copy/paste the following lines. Make sure `ports:` has the same indent as `environments:`. These lines to set the ports for tracing between the agent container and other containers. Port `8126` is the default port for tracing. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/apm/?tab=java#tracing-from-the-host" target="_blank">Tracing Docker Applications</a> documentation.
```
    ports:
      - "8126:8126"
```{{copy}}
5. Below the **volumes** list, copy/paste the following lines. Make sure `labels:` has the same indent as `volumes:`. These lines allow Datadog to identify the log source for the container and automatically install the corresponding integration. This **Autodiscovery** feature speeds up the setup process for log collection. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation.
```
    labels:
      - com.datadoghq.ad.logs: '[{"source": "datadog-agent", "service": "agent"}]'
```{{copy}}


In particular, notice the following. <p> **Line 8** assigns the `env:` tag to the application. By assigning this tag, all data coming from the Storedog application is scoped to this environment. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#environment-variables" target="_blank">Docker Agent Setup</a> documentation. <p> **Lines 9 and 10** set the ports for tracing between the agent container and other containers. Port `8126` is the default port for tracing. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/apm/?tab=java#tracing-from-the-host" target="_blank">Tracing Docker Applications</a> documentation.
3. d <p> **Line 7** enables trace collection for the agent using the environment variable `DD_APM_ENABLED=true`. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#optional-collection-agents" target="_blank">Tracing Docker Applications</a> documentation. <p> **Lines 8 and 9** enable log collection from the agent container and from the all other containers using the environment variables `DD_LOGS_ENABLED=true` and `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true`, respectively. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation. <p> **Lines 18 and 19** allow Datadog to identify the log source for the container and automatically install the corresponding integration. This **Autodiscovery** feature speeds up the setup process for log collection. To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation.
 

With tracing enabled for the Datadog agent, let's take a look at how the different services of the application are instrumented.
