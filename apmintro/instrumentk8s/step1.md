In the terminal on the right, the Storedog app is being deployed on Kubernetes. To deploy the app, the following yaml files are run. The yaml files for the  

The metrics server is responsible for collecting resource metrics from kubelets and exposing them


https://github.com/kubernetes-sigs/metrics-server 
https://docs.datadoghq.com/integrations/kube_metrics_server/#pagetitle 
https://github.com/DataDog/integrations-core/blob/master/kube_metrics_server/datadog_checks/kube_metrics_server/data/conf.yaml.example

kubectl apply -f datadog/k8s-manifests/metrics-server/

The command `kubectl apply -f /root/datadog/k8s-manifests/ecommerce-app/` is run to bring the ecommerce app online using the files in `k8s-manifests/ecommerce-app/`{{open}}. You'll go through these files in the later in the activity. 

The command `kubectl apply -f /root/datadog/serviceaccount.yaml` is run to create a service account for the Datadog Agent and give it the right RBAC persmissions. Click `serviceaccount.yaml`{{open}} to browse the file.


