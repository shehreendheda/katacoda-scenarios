
First do `export DD_API_KEY`

```
kubectl create secret generic datadog-api --from-literal=token=$DD_API_KEY
kubectl apply -f taggingk8s/lotsofpods.yaml
kubectl apply -f taggingk8s/datadog.yaml
```{{execute}}



`kubectl apply -f taggingk8s/couplemore.yaml`{{execute}}
