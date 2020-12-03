#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /ecommworkshop

while [ ! -f /ecommworkshop/docker-compose-broken.yml ]; do
    printf '.'
    sleep 2; 
done
printf '\n'

docker-compose -f docker-compose-broken.yml up -d
clear
prep-environment