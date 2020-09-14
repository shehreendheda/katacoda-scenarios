#!/bin/bash

docker-compose -f docker-compose-fixed-instrumented.yml stop
rm /root/app-files/store-frontend-broken-instrumented/store-frontend/tmp/pids/*
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
prep-environment