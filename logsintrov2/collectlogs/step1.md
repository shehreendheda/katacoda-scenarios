
1. To start gathering the application logs, we need to add a couple environment variables and a new volume to the `datadog` container. Open `docker-compose.yml`{{open}} in the editor on the right. Add these two environment variables to the `environment` list in the `datadog` section:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert environment variables here">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre>

    _Make sure these environmment variables are intended at the same level as the others in the `environment` list._

    And then add this line to the `volumes` list in the `datadog` section:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert volume here">
         - /opt/datadog-agent/run:/opt/datadog-agent/run:rw</pre>

2. Press CTRL-C in the **Terminal** to stop docker-compose. Then add the following label to the redis block in your docker-compose.yml file:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert redis labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "redis", "service": "redis"}]'</pre>

3. Add the following label to the nginx block in the same file:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert nginx labels here">
         com.datadoghq.ad.logs: '[{"source": "nginx", "service": "nginx"}]'</pre>

1. Add the following labels to the docker-compose.yml file for the api and thinker containers:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert api labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-api"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert thinker labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-microservice"}]'</pre>