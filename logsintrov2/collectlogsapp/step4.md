The `discounts` and `advertisements` services have a Python Flask framework, so the services are instrumented using the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Python tracing library</a> `ddtrace`. 

The standard `logging` library in `ddtrace` supports automatic trace ID and span ID injection. However, to enabling trace ID/span ID injection, you have to add the environment variable `DD_LOGS_INJECTION=true` to the services in the docker-compose file for this to happen. (For more details, you can view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/python/#automatically-inject-trace-and-span-ids" target="_blank">Connecting Python Logs and Traces</a> documentation.)

In addition, to enable Autodiscovery and the `python` Integration and Integration Pipeline, you'll need to add the `com.datadoghq.ad.logs` label to the docker-compose file to update the `source` and `service` tags. 

`source:python` will trigger the associated **python** Integration and Integration Pipeline to be used to collect and process the logs.

`service:<SERVICE_NAME>` will correlate the logs for each service with APM Service Page and other associated metric and trace data with the `service` tag assigned by the `DD_SERVICE` environment variable.

1. Click `deploy/docker-compose/docker-compose-fixed.yml`{{open}}. 

2. Click **Copy to Editor** below to add the `DD_LOGS_INJECTION=true` environment variables under `discounts`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add discounts env variables">
         - DD_LOGS_INJECTION=true</pre> 

3. Click **Copy to Editor** below to add the correct `source` and `service` tags under `discounts`. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add discounts log labels">
         com.datadoghq.ad.logs: '[{"source": "python", "service": "discounts-service"}]'</pre>

    The **discounts** section of the docker-compose file should now look like the screenshot below. 
    
    <p> ![instrumented-discounts](collectlogsapp2/assets/instrumented-discounts.png)

4. Click **Copy to Editor** below to add the following to the `DD_LOGS_INJECTION=true` environment variable under `advertisements`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add ads env variables">
         - DD_LOGS_INJECTION=true</pre> 

5. Click **Copy to Editor** below to add the following logs configuration label under `advertisements`. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add ads log labels">
         com.datadoghq.ad.logs: '[{"source": "python", "service": "advertisements-service"}]'</pre>

    The **advertisements** section of the docker-compose file should now look like the screenshot below. 
    
    ![instrumented-advertisements](collectlogsapp2/assets/instrumented-advertisements.png)

    One more step is needed to finalize log collection for these services. These services are dependent on a postgres database. As a final step, let's enable log collection for the db.

6. Click **Copy to Editor** below to add labels to enable logs. 

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add db log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "postgresql", "service": "postgres"}]'</pre>

With these steps, the Python/Flask `discounts` and `advertisements` services are configured as needed for Log Management. 
- The logs will have the correct `source` and `service` tags.
- The logs will be processed using the `python` Integration Pipeline.
- The logs will be correlated with associated traces using the `trace_id` tag. 

Now that log collection by the Datadog Agent is enabled and the Storedog app services are configured, let's explore the logs for the Storedog App.