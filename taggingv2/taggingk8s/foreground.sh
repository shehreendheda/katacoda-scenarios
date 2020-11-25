#!/bin/bash

while [ ! -f /root/taggingk8s/lotsofpods.yaml ]; do sleep 1; done
while [ ! -f /root/taggingk8s/datadog.yaml ]; do sleep 1; done
clear
kubectl create secret generic datadog-api --from-literal=token=$DD_API_KEY
kubectl apply -f taggingk8s/lotsofpods.yaml
kubectl apply -f taggingk8s/datadog.yaml