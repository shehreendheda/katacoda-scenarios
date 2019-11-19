#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
sleep 2
check-file
cd /app-files
clear
docker-compose up -d
clear
prep-environment