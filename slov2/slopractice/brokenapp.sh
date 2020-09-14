#!/bin/bash

clear
docker-compose -f docker-compose-fixed-instrumented.yml stop
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
prep-environment