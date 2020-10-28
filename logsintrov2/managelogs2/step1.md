
1. Install the Docker agent and enable log collection.
    ```
    docker run -d --name datadog-agent \
            -e DD_API_KEY=8d3d82e989c544938928d545583ae582 \
            -e DD_LOGS_ENABLED=true \
            -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
            -e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-agent" \
            -v /var/run/docker.sock:/var/run/docker.sock:ro \
            -v /proc/:/host/proc/:ro \
            -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
            -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
            datadog/agent:latest
    ```{{execute}}

    The commands related to log collection are the following:

    `-e DD_LOGS_ENABLED=true`: this parameter enables log collection when set to true. The Agent now looks for log instructions in configuration files.

    `-e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true`: this parameter adds a log configuration that enables log collection for all containers (see Option 1 below)

    `-v /opt/datadog-agent/run:/opt/datadog-agent/run:rw`: to make sure we do not lose any logs from containers during restarts or network issues, we store on the host the last line that was collected for each container in this directory.

    `-e DD_CONTAINER_EXCLUDE_LOGS="name:datadog-agent"`: to prevent the Datadog Agent from collecting and sending its own logs. Remove this parameter if you want to collect the Datadog Agent logs.

2. Click the command to genernate fake apache logs in a container alongside the Datadog Agent container. 
    
    `docker run --name flog -d -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2`{{execute}}

3. Add the `source` tag to enable the OOTB Integration Pipeline.        
    `--label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]'`

    First, click the command  `docker kill flog`{{execute}} to kill the container running flog.  

    Then, click the command to below to run a new docker container with the `source` and `service` tag. 
    
    `docker run --name flog -d --label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]' -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2`{{execute}}
