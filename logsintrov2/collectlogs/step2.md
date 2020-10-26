The environment is running and the Datadog Agent in configured to collect logs. Let's view the <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Log Explorer</a> to see the logs that are being collected.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. 

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 
    
    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

3. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog. 

    Notice that logs from the Datadog Agent are being collected. Remember that the environment variable `DD_LOGS_ENABLED=true` enabled log collection from the Datadog Agent.

    Also, notice that logs from the Redis and Nginx are being collected. Remember that the environment variable `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enabled log collection for all containers.

4. Click a log for the `agent` to open the <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the logs details. Repeat for a log for `redis` and for `nginx`.

    The logs for each service have a processed list of **Event Attributes**. The logs are processed because the Integration Pipelines for these sources have been automatically installed for the following reasons.

    `agent` - The configuration steps that you completed on the previous page enabled log collection and Integration Pipeline installation for the Datadog Agent. 

    `redis` - Redis is one of the default <a href="https://docs.datadoghq.com/agent/docker/integrations/?tab=file#datadog-redis-integration" target="_blank">Autodiscovery configuration file templates</a>packaged with the Agent v6.2+. Autodiscovery applies this template to any container on the same host that runs a redis image. This results in the Datadog Agent identifiying the redis container and automatically installing the Redis Integration and Integration Pipeline in Datadog.
    
    `nginx` - The following lines in the `nginx` section of the `docker-compose.yml`{{open}} are used by <a href="https://docs.datadoghq.com/agent/docker/integrations/?tab=docker" target="_blank">Datadog's Autodiscovery feature</a> to <a href="https://docs.datadoghq.com/agent/docker/log/?tab=nginxdockerfile#examples" target="_blank"> automatically enable log collection and integration pipeline installation</a>.
    ```
        labels:
          com.datadoghq.ad.check_names: '["nginx"]'
          com.datadoghq.ad.init_configs: '[{}]'
          com.datadoghq.ad.instances: '[{"nginx_status_url": "http://%%host%%:%%port%%/nginx_status"}]'
    ```
    
    But what about the api and thinker services of the application? There are no logs in the list for these services.

5. Click the **Terminal 2** tab. Then, click each of these commands to run them in the terminal.

    `curl -X GET 'http://localhost:8080/think/?subject=technology'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=religion'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=war'`{{execute T2}}
    
    `curl -X GET 'http://localhost:8080/think/?subject=work'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=music'`{{execute T2}}

6. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> and select `root-api` in the **Service** list under the Facets tab. You may need to click the refresh button in the upper right near the time range selector.

    ![root-api-facet](collectlogs/assets/root-api-facet2.png)

    Notice that, although you clicked 5 commands, there are a total of 10 logs---that is, 2 logs for each command.

    It looks like the logs for the `api` and `thinker` services are likely being grouped as `root-api`.
    
7. Click the `root-api` log to see its details. 

   ![root-api-log](collectlogs/assets/root-api-log.png)

    Notice that, unlike the log details for `agent`, `redis`, and `nginx`, the log for this service is not processed so there are no **Event Attributes**. The `api` and `thinker` services are custom services, so OOTB Integrations and Integration Pipelines are not available for these.

Let's update the labels for the `api` and `thinker` services so they are clearly labeled.


