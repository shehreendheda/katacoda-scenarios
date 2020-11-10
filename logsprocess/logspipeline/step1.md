Before you create the custom pipeline, you need to first install the Datadog Agent to collect data for Datadog and the custom apache log source to generate logs. You'll be running these in a Docker environment, so you'll need to follow the instructions for log collection from Docker containers.

1. Click the code block below to install the containerized Datadog Agent and enable log collection. 
    ```
    docker run -d --name datadog-agent \
            -e DD_API_KEY=${DD_API_KEY} \
            -e DD_LOGS_ENABLED=true \
            -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
            -e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-agent" \
            -v /var/run/docker.sock:/var/run/docker.sock:ro \
            -v /proc/:/host/proc/:ro \
            -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
            -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
            datadog/agent:latest
    ```{{execute}}

    Note: Detailed instructions for agent installation can be found in <a href="https://app.datadoghq.com/logs/onboarding/container" target="_datadog">**Log > Getting Started**</a>. Select **Container**, and then **Docker** to view the detailed instructions for installation.)

    The following parameters are related to log collection in the command above:

    `-e DD_LOGS_ENABLED=true`: this parameter enables log collection when set to true. The Agent now looks for log instructions in configuration files.

    `-e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true`: this parameter adds a log configuration that enables log collection for all containers (see Option 1 below)

    `-v /opt/datadog-agent/run:/opt/datadog-agent/run:rw`: to make sure we do not lose any logs from containers during restarts or network issues, we store on the host the last line that was collected for each container in this directory.

    `-e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-agent"`: to prevent the Datadog Agent from collecting and sending its own logs. Remove this parameter if you want to collect the Datadog Agent logs. In this case, you want to only focus on logs from the apache source.

2. Click the command below to install the custom apache log source in a container alongside the Datadog Agent container. 
    
    `docker run --name flog -d -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2`{{execute}}

3. Add the `source` tag to enable the OOTB Integration Pipeline.        
    `--label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]'`

    First, click the command  `docker kill flog`{{execute}} to kill the container running flog.  

    Then, click the command to below to run a new docker container with the `source` and `service` tag. 
    
    `docker run --name flog -d --label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]' -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2`{{execute}}
