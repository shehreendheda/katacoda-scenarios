#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /ecommworkshop
docker-compose -f docker-compose-broken.yml up -d
clear
prep-environment