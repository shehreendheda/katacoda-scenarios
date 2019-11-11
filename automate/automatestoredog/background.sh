#!/bin/bash
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
mkdir /create-slo
git clone https://github.com/burningion/ecommerce-observability /create-slo
cd /create-slo
git checkout instrumented-fixed
docker-compose pull

#while [ ! -f /root/.kcrc ]; do sleep 1; done
#source /root/.kcrc

./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1