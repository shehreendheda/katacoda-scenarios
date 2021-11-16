#!/bin/bash

curl -sk https://datadoghq.dev/katacodalabtools/r?raw=true|bash

cd /root/lab

# Remove any leftover state (some katacoda setups leave state between browser refreshes)
# 1. stuff running in docker
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
# 2. movies-api repository
rm -rf dd-continuous-profiler-dash2021/
# 3. stop any leftover copies of movies-api-java
pkill -f dd-continuous-profiler-dash2021
# -----

git clone https://github.com/DataDog/dd-continuous-profiler-dash2021.git

cd dd-continuous-profiler-dash2021

# Start up mongodb
docker-compose up -d movies-api-mongo

# Prewarm gradle
#./gradlew compileJava

statusupdate "environment to be ready..."

# Download this so it'll be ready when needed in later steps
# This is on purpose after the status update as learners can start the exercise while this gets going
docker pull datadog/agent:latest
