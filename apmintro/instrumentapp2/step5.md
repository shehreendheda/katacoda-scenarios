The `discounts` and `advertisements` services have a Python-Flask framework, so the services are instrumented using the Python tracing library `dd-trace`. The dd traceFirst, the `dd-trace` library is added to the list of required libraries, and then, the docker-compose.yml is updated for trace injection, log injections and App Analytics for each service.

#### Discounts Service

1. Click `discounts-service/requirements.txt`{{open}} to view the list of required libraries that are installed for the service. The `dd-trace` library (**Line 4**) has already been included for you.

2. Click `docker-compose.yml`{{open}}. 

3. Under the **discounts** service (**Line 20**), copy/paste the following lines in the `environment:` list. Make sure the new lines have the same indent as **Line 26**.
```
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true
```{{copy}} <p> `DATADOG_TRACE_AGENT_HOSTNAME` defines the address of the Agent that the tracer submits to (similar to **Line 6** in `store-frontend/config/initializers/datadog.rb`{{open}}). <p> `DD_LOGS_INJECTION` enables automatic injection of trace IDs into the logs from the supported logging libraries to correlate traces and logs. <p> `DD_ANALYTICS_ENABLED` enables App Analytics for the traces.

4. Under the **discounts** service (**Line 20**), update the the command that brings up the Flask server (**Line 31**) with the `ddtrace-run` wrapper. 
```
    command: ddtrace-run flask run --port=5001 --host=0.0.0.0
```{{copy}} <p> `ddtrace-run` automates instrumentation for the service. You can view more details for automatic and manual instrumentation using `ddtrace` in the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Datadog Python Trace and Profile Client</a> documentation. 

5. Under the **discount** service (**Line 20**), copy/paste the following lines below the `volumes` list. <p> Note: Make sure `labels:` has the same indent as `volumes:`. 
```
    labels:
      - com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'
```{{copy}} <p> The **frontend** portion of the `docker-compose.yml` should now look like ![instrumented-discounts](instrumentapp2/assets/instrumented-discounts.png) <p> Let's restart the docker deployment to apply these changes.

6. Click `docker-compose up -d`.

7. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in. <p> You should now see traces for the `discounts` service in the list. This may take a couple minutes.

8. Click on a trace for the `store-frontend` service to view the flame graph, span list, tags, related infrastructure, and related logs.

#### Advertisements Service

Because the advertisements service also has a Python-Flask framework, you can instrument the advertisements service the following the same steps as for the discounts service. The dd-trace library has already been installed for you for this service (**Line 4** in `ads-service/requirements.txt`{{open}}).

Follow steps 2-8 above for the advertisements service (**Line 61**).

With these steps, the Python-based services are also instrumented for APM with Datadog. 


