#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
while [ ! -f /root/app-files/docker-compose-files/docker-compose-fixed-instrumented.yml ]; do sleep 2; done
cd /root/app-files/docker-compose-files
#sed -i 's/ads-service/advertisements-service/' docker-compose-fixed-instrumented.yml
clear
docker-compose -f docker-compose-fixed-instrumented.yml up -d
clear
prep-environment