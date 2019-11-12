#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
#sleep 15
while [ ! -f /create-slo/docker-compose.yml ]; do sleep 1; done
cd /create-slo
docker-compose up -d
clear
prepping-the-environment