The `discounts` and `advertisements` services have a Python-Flask framework, so the services are instrumented using the Python tracing library `dd-trace`. First, the `dd-trace` library is added to the list of required libraries, and then, the docker-compose.yml is updated for trace injection, log injection, and App Analytics.

#### Discounts Service

1. Click `discounts-service/requirements.txt`{{open}} to view the list of required libraries that are installed for the service. The `dd-trace` library (**Line 4**) has already been included.

2. Click `docker-compose.yml`{{open}}. 

3. Under **services** (**Line 2**), view the details for the **discounts** (**Line 20**). <p> Let's add the code for enabling trace and log collection.

4. Copy/paste the following lines in the `environment:` list. These are the same environment variables you added for the store-frontend service. <p> Note: Make sure the new lines have the same indent as **Line 26**.
```
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true
```{{copy}}

5. Update the command that brings up the Flask server (**Line 31**) with the `ddtrace-run` wrapper. 
```
    command: ddtrace-run flask run --port=5001 --host=0.0.0.0
```{{copy}} <p> `ddtrace-run` automates instrumentation for the service. You can view more details for automatic and manual instrumentation using `ddtrace` in the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Datadog Python Trace and Profile Client</a> documentation. 

6. Copy/paste the following lines below the `volumes` list. <p> Note: Make sure `labels:` has the same indent as `volumes:`. 
```
    labels:
      - com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'
```{{copy}} <p> The **discounts** portion of the `docker-compose.yml` should now look like the screenshot below. <p> ![instrumented-discounts](instrumentapp2/assets/instrumented-discounts.png) <p> Let's restart the docker deployment to apply these changes.

7. Click `docker-compose up -d`{{execute}}.

8. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in. <p> You should now see traces for the `discounts` service in the list. This may take a couple minutes.

9. Click on a trace for the `discounts` service to view the Flame Graph, Span List, Tags, related Hosts, and related Logs.

#### Advertisements Service

Because the advertisements service also has a Python-Flask framework, you can instrument the advertisements service the following the same steps as for the discounts service. The dd-trace library has already been installed for you for this service (**Line 4** in `ads-service/requirements.txt`{{open}}).

Follow steps 2-9 above for the advertisements service (**Line 61**). In step 4, make sure to leave the port as `--port=5002` in the command.

With these steps, the Python-based services are also instrumented for APM with Datadog. The following **Services** should now in the listed under the **Facets** to the left of the Traces list. <p> The `postgres` service appears in the list because it is installed and automatically instrumented to support the discounts and advertisements services using **Line 12** in `discounts-service/requirements.txt`{{open}} and `ads-service/requirements.txt`{{open}}, respectively. You can view <a href="http://pypi.datadoghq.com/trace/docs/db_integrations.html#module-ddtrace.contrib.psycopg" target="_blank"> Datadog's Python tracing client</a> for more details. 

![trace-services](instrumentapp/assets/trace-services.png)

If you don't see the services listed above, you can click **Solution** below to check that you instrumented the `advertisements` service correctly.