#!/bin/bash

docker container kill $(docker ps -q)
docker-compose -f docker-compose-broken-instrumented.yml up -d