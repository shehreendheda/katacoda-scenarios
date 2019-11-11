#!/bin/bash

sleep 10
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker-compose up -d
clear
prepping-the-environment