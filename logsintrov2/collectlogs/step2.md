<a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation" target="_datadog">Log collection</a> has to be enabled for the Datadog Agent so that logs from the Agent container as well as the application services containers can be collected by Datadog.

1. Click `docker-compose.yml`{{open}}.

2. Click **Copy to Editor** in the block below to add the following environment variables for the agent.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert environment variables here">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre>

    (Note: Make sure the environmment variables are indented at the same level as the others in the `environment` list.)

    `DD_LOGS_ENABLED=true` enables log collection. 

    `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enables log collection for all containers.

3. Click **Copy to Editor** in the block below add the following volume.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert volume here">
         - /opt/datadog-agent/run:/opt/datadog-agent/run:rw</pre>

    (Note: Make sure the volume name is indented at the same level as the others in the `volumes` list.)

    `/opt/datadog-agent/run:/opt/datadog-agent/run:rw` mounts a persistent host volume to store the Agent's logging registry. The registry stores a reference to the last log line collected for each container. Persisting the registry on the host prevents loss of container logs during restarts or network issues.

4. Click the terminal on the right and enter **CTRL-C** to stop the process.

5. Click the command `docker-compose stop && docker-compose rm -f && docker-compose up --build`{{execute}} to restart the Docker environment.

6. Wait for the terminal to display the output from the restarted containers before you continue.

    ![env-restarted](collectlogs/assets/env-restarted.png)

