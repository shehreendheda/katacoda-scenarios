#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

statusupdate tools

statuscheck apikey

DD_API_KEY=`cat /root/.dd_api_key`

wall -n ${DD_API_KEY}

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

statusupdate complete