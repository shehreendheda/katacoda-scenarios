#!/bin/bash

echo starting...
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
cd /create-slo
docker-compose up -d

./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1