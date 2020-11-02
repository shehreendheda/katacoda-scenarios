When you viewed the logs collected for the `discounts-service` and the `advertisements-service`, you noticed three features about the log details (example in the image below).

- The `source` and `service` tags were not assigned as needed.
- The **Event Attributes** were not listed. That is, the collected logs were not processed.
- There were no traces correlated with the logs.

![discounts-service-log2](collectlogsapp/assets/discounts-service-log2.png)

You can add the `com.datadoghq.ad.logs` label to the docker-compose file to update the `source` and `service` tags, like you did for the `store-frontend`. You will see that adding the label will not only update these tags, but the `source:python` tag will trigger the associated **python** Integration and Integration Pipeline to be used to collect and process the logs.

First, though, you'll enable log and trace correlation using the the environment variable `DD_LOGS_INJECTION=true`. The `discounts` and `advertisements` services have a Python Flask framework, so the services are instrumented using the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Python tracing library</a> `ddtrace`. The standard `logging` library in `ddtrace` supports automatic trace ID and span ID injection. However, the environment variable `DD_LOGS_INJECTION=true` has to be added to the service in the docker-compose file for this to happen. (For more details, you can view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/python/#automatically-inject-trace-and-span-ids" target="_blank">Connecting Python Logs and Traces</a> documentation.)


#### Discounts Service

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}}. 

2. Click **Copy to Editor** below to add the `DD_LOGS_INJECTION=true` environment variables under `discounts`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add discounts env variables">
         - DD_LOGS_INJECTION=true</pre> 

3. Click **Copy to Editor** below to add the correct `source` and `service` tags under `discounts`. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add discounts log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "python", "service": "discounts-service"}]'</pre>

4. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment to apply these changes. 

    The **discounts** section of the docker-compose file should now look like the screenshot below. <p> ![instrumented-discounts](collectlogsapp/assets/instrumented-discounts.png)

5. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, and make sure `env:ruby-shop` is the search query. 

6. When logs for the `discounts-service` service start displaying in the Log Explorer, click a `discounts-service` log that has a structure that is similar to the one shown below.

    ![frontend-example-log](collectlogsapp/assets/frontend-example-log.png)

    The Log Side Panel with the log details will open.
   
    ![store-frontend-log-final](collectlogsapp/assets/store-frontend-log-final.png)

    Notice that the `source` value is now `python` and the `service` value is now `discounts-service`, based on the label you added in step 3. 
    
    The `source` tag is detected by Autodiscovery and uses the `python` Integration and Integration Pipelines are used to collect and process the logs.

    The `service` tag for the logs now matches the `DD_SERVICE` environment variable that sets the service name for the trace data. When you click the `service` tile in the log and select **Go to APM service page**, you will be redirected to the **Service List** filtered on `store-frontend`.

#### Advertisements Service

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}}. 

2. Click **Copy to Editor** below to add the following to the `DD_LOGS_INJECTION=true` environment variable under `advertisements`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add ads env variables">
         - DD_LOGS_INJECTION=true</pre> 

3. Click **Copy to Editor** below to add the following logs configuration label under `advertisements`. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add ads log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "python", "service": "advertisements-service"}]'</pre>

5. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment to apply these changes. <p> The **advertisements** section of the docker-compose file should now look like the screenshot below. <p> ![instrumented-adverstisements](collectlogsapp/assets/instrumented-advertisements.png)

6. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in. <p> You should now see traces for the `advertisements` service in the list. This may take a couple of minutes.

7. Click a trace for the `advertisements` service to view the Flame Graph, Span List, Tags, related Hosts, and related Logs.

    With these steps, the Python-based services are ready for Log Management with Datadog. 
    
    These services are dependent on a postgres database. As a final step, let's enable log collection for the db.

8. Click **Copy to Editor** below to add labels to enable logs. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add db log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "postgresql", "service": "postgres"}]'</pre>



The final list for **Service** under **Facets** is shown below.

![trace-services](collectlogsapp/assets/trace-allservices.png)



### Assessment
Click `grademe`{{execute}} to receive a grade for this activity.