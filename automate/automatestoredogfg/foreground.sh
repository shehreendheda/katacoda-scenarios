#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
check-file
cd /app-files
docker-compose up -d
clear
prepping-the-environment