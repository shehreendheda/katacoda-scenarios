#!/bin/bash

clear
docker-compose -f docker-compose-fixed.yml stop
docker-compose -f docker-compose-fixed.yml rm -f
docker-compose -f docker-compose-broken.yml up -d
clear
prep-environment