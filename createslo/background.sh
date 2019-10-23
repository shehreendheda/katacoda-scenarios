#!/bin/bash
mkdir /create-slo
git clone https://github.com/burningion/ecommerce-observability /create-slo
cd /create-slo
git checkout instrumented-fixed
docker-compose pull