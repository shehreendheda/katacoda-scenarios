#!/bin/bash

mkdir /root/app-files
git clone https://github.com/burningion/ecommerce-observability /root/app-files
cd /root/app-files
git checkout instrumented
docker-compose pull

./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1