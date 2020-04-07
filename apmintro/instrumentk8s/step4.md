Let's now instrument the datadog agent for APM and Log collection.

1. Click `datatag-agent-uninstrumented.yaml`{{open}} to open the Daemonset configuration file for the Datadog Agent.
2. Browse the file to view the details of the deployment. <p> Let's fill in the missing code for APM and Log Collection.
3. Copy and paste the following lines on **Line 36** under the APM banner in under `ports:` (**Line 23**).
```
            - containerPort: 8126
              hostPort: 8126
              name: traceport
              protocol: TCP
```{{copy}} <p> The port for allowing incoming trace data is 8126. You can learn more in the <a href="https://docs.datadoghq.com/agent/kubernetes/apm/?tab=daemonset#setup" target="_blank">Kubernetes Trace Collection</a> documentation.
4. Copy and paste the following lines on **Line 81** under the APM banner in `env:` (**Line 81**).
```
            - name: DD_APM_ENABLED
              value: 'true'
            - name: DD_APM_NON_LOCAL_TRAFFIC
              value: 'true'
            - name: DD_APM_ENV
              value: "ruby-shop"
            - name: DD_TAGS
              value: "env:ruby-shop"
```{{open}} <p> To learn more about each environment variable, view the <a href="https://docs.datadoghq.com/agent/kubernetes/apm/?tab=daemonset#agent-environment-variables" target="_blank">Kubernetes Trace Collection - Agent Environment Variables</a> documentation.
