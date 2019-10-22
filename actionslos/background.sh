#!/bin/bash
mkdir /action-slo
git clone https://github.com/burningion/ecommerce-observability /action-slo
cd /action-slo
git checkout instrumented-fixed
docker-compose pull