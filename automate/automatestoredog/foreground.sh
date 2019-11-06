#!/bin/bash

sleep 10
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /create-slo
docker-compose up -d