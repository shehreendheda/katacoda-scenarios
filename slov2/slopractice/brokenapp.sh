#!/bin/bash

docker-compose -f docker-compose-fixed-instrumented.yml stop
clear
docker-compose -f docker-compose-broken-instrumented.yml up -d
clear
alias app_ready="printf '\n\nThe app has restarted! You can continue.\n\n'"
clear
app_ready