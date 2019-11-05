#!/bin/bash
mkdir /create-slo
git clone https://github.com/burningion/ecommerce-observability /create-slo
cd /create-slo
git checkout instrumented-fixed
docker-compose pull

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DD_API_KEY=2854d54a1db0a7d90c7b8b6f1573e361 
cd /create-slo
docker-compose up -d

./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1