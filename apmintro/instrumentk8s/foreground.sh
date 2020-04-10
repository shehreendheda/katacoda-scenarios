#!/bin/bash

while [ ! -f "/usr/local/bin/prepenvironment" ]; do
  sleep 0.3
done
sleep 0.3

kubectl create secret generic datadog-secret --from-literal=api-key=$DD_API_KEY
clear
export host_name=[[KATACODA_HOST]]
export sub_domain=[[HOST_SUBDOMAIN]]
echo $host_name
echo $sub_domain
prepenvironment