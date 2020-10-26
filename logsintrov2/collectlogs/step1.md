The Flask application in the environment is supported by NGINX, Redis, an API, and a thinker microservice. A docker-compose.yml has been created to help you bring the application online and configure it for data collection with the Datadog Agent.

1. Click `docker-compose.yml`{{open}} to view its details.

     All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

     Each application service runs in its own Docker container: `api`, `thinker`, `redis`, and `nginx`.

     Because the application is run in a Docker (containerized) environment, the Datadog Agent also runs in a container alongside the other containers: `datadog`. 

     Metric and trace collection has been configured, but log collection is not yet configured.

     <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation" target="_datadog">Log collection</a> has to be enabled for the Datadog Agent so that logs from the Agent container as well as the application services containers can be collected by Datadog.

2. Click **Copy to Editor** in the block below to add the following environment variables for the agent.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert environment variables here">
         - DD_LOGS_ENABLED=true
         - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre>

    (Note: Make sure the environmment variables are indented at the same level as the others in the `environment` list.)

    `DD_LOGS_ENABLED=true` enables log collection. 

    `DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true` enables log collection for all containers.

3. Click **Copy to Editor** in the block below to add the following volume.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert volume here">
         - /opt/datadog-agent/run:/opt/datadog-agent/run:rw</pre>

    (Note: Make sure the volume name is indented at the same level as the others in the `volumes` list.)

    `/opt/datadog-agent/run:/opt/datadog-agent/run:rw` mounts a persistent host volume to store the Agent's logging registry. The registry stores a reference to the last log line collected for each container. Persisting the registry on the host prevents loss of container logs during restarts or network issues.

     With the agent configured for log collection, you're ready to start the environment.

4. Click the command `docker-compose up --build`{{execute}} to start the environment in the terminal on the right.

     When the output in the terminal looks like the following image, the environment is ready and you can continue.

     ![env-online](collectlogs/assets/env-online.gif)

