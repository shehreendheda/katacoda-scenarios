#! /usr/bin/env

docker run -d --name datadog-agent \
    -e DD_API_KEY=${DD_API_KEY} \
    -e DD_LOGS_ENABLED=true \
    -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
    -e DD_CONTAINER_EXCLUDE_LOGS="image:datadog/agent" \
    -e DD_ENV="logspipeline" \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /proc/:/host/proc/:ro \
    -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
    -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
    datadog/agent:latest

docker run --name flog -d -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2

prepenvironment