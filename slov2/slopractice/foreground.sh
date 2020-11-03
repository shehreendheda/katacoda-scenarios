#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
clear
while [ ! -f /root/app-files/docker-compose-files/docker-compose-fixed-instrumented.yml ]; do sleep 2; done
cd /root/app-files/docker-compose-files
#sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/api/config/initializers/datadog.rb
#sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/config/initializers/datadog.rb
#sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/frontend/config/initializers/datadog.rb
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
#mv /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh
clear
docker-compose -f docker-compose-fixed-instrumented.yml up -d
clear
prep-environment