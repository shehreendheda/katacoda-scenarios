#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
while [ ! -f /app-files/docker-compose.yml ]; do sleep 2; done
cd /app-files
clear
docker-compose up -d
clear
prep-environment