For APM in Datadog, you need to enable trace collection by the Datadog agent. To use the added feature of correlating trace and related log data, you will also need to enable log collection.

Click `docker-compose.yml`{{open}} to view the file in the editor on the right. 

The docker-compose.yml instruments the Datadog agent and app services for monitoring with Datadog. 

**Line 7** enables trace collection for the agent using the environment variable `DD_APM_ENABLED=true`. (To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#environment-variables" target="_blank">Tracing Docker Applications</a> documentation.) 

**Lines 8 and 9** enables log collection from the agent container and from the all other containers using the environment variables `DD_LOGS_ENABLED=true` and `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true`, respectively. (To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#one-step-install-to-collect-all-the-container-logs" target="_blank">Docker Log Collection</a> documentation.)

**Lines 12 and 13** set the ports for tracing between the agent container and other containers. Port `8126` is the default port for tracing. (To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#environment-variables" target="_blank">Tracing Docker Applications</a> documentation.) 

**Lines 18 and 19** allow Datadog to identify the log source for each container and automatically install the corresponding integration. This **Autodiscovery** feature speeds up the setup process for log collection. (To learn more, view the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation.) 

With tracing enabled for the Datadog agent, let's take a look at how the different services of the application are instrumented.
