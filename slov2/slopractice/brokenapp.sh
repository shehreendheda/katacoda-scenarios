#!/bin/bash

docker-compose -f docker-compose-fixed-instrumented.yml stop
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
source /root/.bashrc
clear
app_ready