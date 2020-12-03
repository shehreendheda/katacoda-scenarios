#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
while [ ! -f /ecommworkshop/docker-compose-broken.yml ]; do sleep 2; done
cd /ecommworkshop
docker-compose -f docker-compose-broken.yml up -d
clear
prep-environment