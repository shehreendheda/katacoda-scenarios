The environment is running and the Datadog Agent is configured to collect logs. Let's view the <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Log Explorer</a> to see the logs that are being collected.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. 

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 
    
    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again. You'll be redirected to the **Log Explorer**.

3. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog to view the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a>.

    ![agent-nginx-redis-logs](collectlogs/assets/agent-nginx-redis-logs.png)

    Notice that logs from the Datadog Agent are being collected. Remember that the environment variable `DD_LOGS_ENABLED=true` enabled log collection from the Datadog Agent.

    Also, notice that logs from Redis and Nginx are being collected. Remember that the environment variable `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enabled log collection for all containers.

4. Click a log for the `agent` to open the <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the log details. Repeat for a `redis` log and an `nginx` log.

    Example of a `redis` log
    ![redis-log](collectlogs/assets/redis-log.png)
    
    The logs for each service have a processed list of **Event Attributes**. The logs are processed because the Integration Pipelines for these sources have been automatically installed for the following reasons. You can navigate to the <a href="https://app.datadoghq.com/account/login" target="_datadog">**Logs > Configuration > Pipelines**</a> to see the installed Integration Pipelines.

    ![agent-nginx-redis-ip](collectlogs/assets/agent-nginx-redis-ip.png)

    `agent` - The final configuration of the agent in the docker-compose.yml enabled log collection and Integration Pipeline installation for the Datadog Agent. 

    `redis` - Redis is one of the default <a href="https://docs.datadoghq.com/agent/docker/integrations/?tab=file#datadog-redis-integration" target="_blank">Autodiscovery configuration file templates</a> packaged with the Agent v6.2+. Autodiscovery applies this template to any container on the same host that runs a redis image. This results in the Datadog Agent identifiying the redis container and automatically installing the Redis Integration and Integration Pipeline in Datadog.
    
    `nginx` - The following lines in the `nginx` section of the `docker-compose.yml`{{open}} are used by <a href="https://docs.datadoghq.com/agent/docker/integrations/?tab=docker" target="_blank">Datadog's Autodiscovery feature</a> to <a href="https://docs.datadoghq.com/agent/docker/log/?tab=nginxdockerfile#examples" target="_blank"> automatically enable log collection and integration pipeline installation</a>.
    ```
        labels:
          com.datadoghq.ad.check_names: '["nginx"]'
          com.datadoghq.ad.init_configs: '[{}]'
          com.datadoghq.ad.instances: '[{"nginx_status_url": "http://%%host%%:%%port%%/nginx_status"}]'
    ```
    
    But what about the `thinker-api` and `thinker-microservice` sources in the application? There are no logs for these in the Log List.

5. Click the **Terminal 2** tab. Then, click each of these commands to run them in the terminal.

    `curl -X GET 'http://localhost:8080/think/?subject=technology'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=religion'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=war'`{{execute T2}}
    
    `curl -X GET 'http://localhost:8080/think/?subject=work'`{{execute T2}}

    `curl -X GET 'http://localhost:8080/think/?subject=music'`{{execute T2}}

6. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> and select `root-api` in the **Service** list under the **Facets** tab. Click a log for `root-api` to see its details. (You may need to click the refresh button in the upper right near the time range selector to refresh the Log List.)

    ![root-api-log2](collectlogs/assets/root-api-log2.png)
    
    Notice that, although you clicked 5 commands, there are a total of 10 logs---that is, 2 logs for each command.

    It looks like the log sources `thinker-api` and `thinker-microservice` are being grouped as `root-api`.

    Also, notice that, unlike the log details for `agent`, `redis`, and `nginx`, the logs for this source are not processed so there are no **Event Attributes**. The `thinker-api` and `thinker-microservice` are custom sources, so OOTB Integrations and Integration Pipelines are not available for these. Also, notice that the `service` and `source` tiles in the log details list `root-api` for each.

Let's update the labels for the `thinker-api` and `thinker-microservice` to correctly match their `source` and `service` names.
