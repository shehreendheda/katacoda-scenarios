#!/bin/bash

mv /root/docker-compose.yml /ecommworkshop/deploy/docker-compose/

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

statusupdate environment