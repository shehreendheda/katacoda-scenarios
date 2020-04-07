The `store-frontend` service of the Storedog app has a Ruby on Rails framework.

1. Click `k8s-manifests/ecommerce-app/frontend.yaml`{{open}} to view the Daemonset configuration file for the store-frontend.

2. Scroll to **Line 38**. <p> The `DD_AGENT_HOST` environemnt variable configures your application pods to pull the host IP in order to communicate with the Datadog Agent. <p> To learn more, view the <a href="https://docs.datadoghq.com/agent/kubernetes/apm/?tab=daemonset#setup" target="_blank">Kubernetes Trace Collection</a> documentation.
3. 