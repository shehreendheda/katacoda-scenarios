#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
sleep 15
cd /create-slo
docker-compose up -d
clear
prepping-the-environment