#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /create-slo
sleep 15
docker-compose up -d
clear
prepping-the-environment