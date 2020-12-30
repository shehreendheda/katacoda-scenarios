#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mv /root/docker-compose-fixed.yml /ecommworkshop/

cd /ecommworkshop
git fetch
git checkout e400e3fc ./ads-service-fixed

statusupdate files