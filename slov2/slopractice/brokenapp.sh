#!/bin/bash

docker container kill $(docker ps -q)
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
printf '\n\nThe app has restarted! You can continue.\n\n'