#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres

statuscheck files

cd /ecommworkshop
rm ./store-frontend-instrumented-fixed
git branch -m master main
git fetch origin
git branch -u origin/main main
git checkout 30e3b3f ./store-frontend-instrumented-fixed
git checkout 30e3b3f ./store-frontend-broken-instrumented


sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service-fixed/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service/requirements.txt
#cp /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh
#cp /root/frontend-docker-entrypoint.sh ./store-frontend-broken-instrumented/docker-entrypoint.sh

cd /ecommworkshop/deploy/docker-compose

#docker system prune --all --force

docker-compose -f docker-compose-no-logs.yml up -d

envready

statusupdate complete


#prepenvironment