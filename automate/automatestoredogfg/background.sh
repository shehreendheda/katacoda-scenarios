#!/bin/bash
mkdir /root/app-files
git clone https://github.com/burningion/ecommerce-observability /app-files
cd /app-files
git checkout instrumented-fixed
docker-compose pull

#while [ ! -f /root/.kcrc ]; do sleep 1; done
#source /root/.kcrc

#export POSTGRES_USER=postgres
#export POSTGRES_PASSWORD=postgres
#docker-compose up -d

./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1