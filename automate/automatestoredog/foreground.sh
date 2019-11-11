#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /create-slo
clear
sleep 10
docker-compose up -d
clear
prepping-the-environment