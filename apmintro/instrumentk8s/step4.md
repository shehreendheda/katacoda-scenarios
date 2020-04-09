Let's now instrument the Datadog Agent for APM and Log collection.

1. Click `datatag-agent-uninstrumented.yaml`{{open}} to open the Daemonset configuration file for the Datadog Agent.

2. Browse the file to view the details of the deployment. <p> Let's fill in the missing code for APM and Log collection.

#### APM

1. Copy and paste the following lines on **Line 36** under the **APM** banner in under `ports:` (**Line 23**). <p> Make sure the indent for the code block matches the indent for the code block on **Line 28-31**.
```
            - containerPort: 8126
              hostPort: 8126
              name: traceport
              protocol: TCP
```{{copy}} <p> The port for allowing incoming trace data is 8126. You can learn more in the <a href="https://docs.datadoghq.com/agent/kubernetes/apm/?tab=daemonset#setup" target="_blank">Kubernetes Trace Collection</a> documentation.

2. Copy and paste the following lines on **Line 81** under the **APM** banner in `env:` (**Line 81**). <p> Make sure the indent for the code block matches the indent for the code block on **Line 75-76**.
```
            - name: DD_APM_ENABLED
              value: 'true'
            - name: DD_APM_NON_LOCAL_TRAFFIC
              value: 'true'
            - name: DD_APM_ENV
              value: "ruby-shop"
            - name: DD_TAGS
              value: "env:ruby-shop"
```{{copy}} <p> To learn more about each environment variable, view the <a href="https://docs.datadoghq.com/agent/kubernetes/apm/?tab=daemonset#agent-environment-variables" target="_blank">Kubernetes Trace Collection - Agent Environment Variables</a> documentation.

#### Log collection

1. Copy and paste the following lines on **Line 81** under the **Log collection** banner in `env:` (**Line 81**). <p> Make sure the indent for the code block matches the indent for the code block in step 4. 
```
            - name: DD_LOGS_ENABLED
              value: 'true'
            - name: DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL
              value: 'true'
            - name: DD_AC_EXCLUDE
              value: 'name:datadog-agent'
            - name: DD_LOGS_CONFIG_K8S_CONTAINER_USE_FILE
              value: 'true'
```{{copy}} <p> To learn more about each environment variable, view the <a href="https://docs.datadoghq.com/agent/kubernetes/log/?tab=daemonset#log-collection" target="_blank">Kubernetes Log Collection</a> documentation.

2. Copy and paste the following lines under the **Log collection** banner in `volumeMounts:` (**Line 123**). <p> Make sure the indent for the code block matches the indent for the code block on **Line 128-135**. 
line 140-143
```
            - name: pointdir
              mountPath: /opt/datadog-agent/run
            - name: logpodpath
              mountPath: /var/log/pods

              # Docker runtime directory, replace this path with your container runtime logs directory,
              # or remove this configuration if `/var/log/pods` is not a symlink to any other directory.
            - name: logcontainerpath
              mountPath: /var/lib/docker/containers
```{{copy}} <p> To learn more about each volumeMount, view the <a href="https://docs.datadoghq.com/agent/kubernetes/log/?tab=daemonset#log-collection" target="_blank">Kubernetes Log Collection</a> documentation.

3. Copy and paste the following lines under the **Log collection** banner in `volumes:` (**Line 180**). <p> Make sure the indent for the code block matches the indent for the code block on **Line 168-176**. 
```
        - hostPath:
            path: /var/lib/datadog-agent/logs
          name: pointdir
        - hostPath:
            path: /var/log/pods
          name: logpodpath
        # Docker runtime directory, replace this path with your container runtime logs directory,
        # or remove this configuration if `/var/log/pods` is not a symlink to any other directory.
        - hostPath:
            path: /var/lib/docker/containers
          name: logcontainerpath
```{{copy}} <p> To learn more about each volume, view the <a href="https://docs.datadoghq.com/agent/kubernetes/log/?tab=daemonset#log-collection" target="_blank">Kubernetes Log Collection</a> documentation.