#!/bin/bash

while [ ! -f /app-files/lotsofpods.yaml ]; do sleep 1; done
while [ ! -f /app-files/datadog.yaml ]; do sleep 1; done
clear
kubectl create secret generic datadog-api --from-literal=token=$DD_API_KEY
kubectl apply -f taggingk8s/lotsofpods.yaml
kubectl apply -f taggingk8s/datadog.yaml