#!/bin/bash

clear
cd /root/app-files/docker-compose-files
docker-compose -f docker-compose-fixed-instrumented.yml stop
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
prep-environment