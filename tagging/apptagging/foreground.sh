#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /ecommworkshop/docker-compose-files
docker-compose -f docker-compose-fixed-instrumented.yml up -d
clear
prep-environment