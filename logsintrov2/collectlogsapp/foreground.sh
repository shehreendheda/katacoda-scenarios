#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
while [ ! -f /root/app-files/docker-compose-files/docker-compose-broken-no-apm-instrumentation.yml ]; do sleep 2; done
cd /root/app-files
mv /root/docker-compose-no-instrumentation /root/app-files/docker-compose-no-instrumentation
#mv docker-compose-broken-no-apm-instrumentation.yml docker-compose-broken-no-instrumentation.yml
#rm docker-compose-broken-no-apm-instrumentation.yml
#sed -i 's/ads-service/advertisements-service/' docker-compose-fixed-instrumented.yml
clear
docker-compose -f docker-compose-no-instrumentation.yml up -d
clear
prep-environment