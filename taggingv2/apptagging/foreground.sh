#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
while [ ! -f /ecommworkshop/docker-compose-fixed.yml ]; do sleep 2; done
cd /ecommworkshop

sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service/requirements.txt

docker-compose -f docker-compose-fixed.yml up -d
clear
prep-environment