
First do `export DD_API_KEY`

```
kubectl create secret generic datadog-api --from-literal=token=$DD_API_KEY
kubectl apply -f k8s-yaml-files/lotsofpods.yaml
kubectl apply -f k8s-yaml-files/datadog.yaml
```{{execute}}



`kubectl apply -f k8s-yaml-files/couplemore.yaml`{{execute}}
