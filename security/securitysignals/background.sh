#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true%7Cbash

mv /root/docker-compose.yml /ecommworkshop/deploy/docker-compose/

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

statusupdate environment