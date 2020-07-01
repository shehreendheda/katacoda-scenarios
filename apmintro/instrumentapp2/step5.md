The `discounts` and `advertisements` services have a Python-Flask framework, so the services are instrumented using the Python tracing library `ddtrace`. First, the `ddtrace` library is added to the list of required libraries, and then, the docker-compose.yml is updated for trace injection, log injection, and App Analytics.

#### Discounts Service

1. Click `discounts-service/requirements.txt`{{open}} to view the list of required libraries that are installed for the service. The `ddtrace` library (**Line 4**) has already been included.

2. Click `docker-compose-files/docker-compose-broken-no-apm-instrumentation.yml`{{open}}. 

3. Under **services** (**Line 2**), view the details for **discounts**. <p> Let's add the code for enabling trace and log collection.

4. Add the following environment variables for the service. Click the code block below to copy the code. In the `docker-compose` file, highlight the comment `# add discounts env variables` and paste the code over the comment. 
```
         - DD_AGENT_HOST=agent
         - DD_LOGS_INJECTION=true
         - DD_ANALYTICS_ENABLED=true
```{{copy}}

5. Add the `ddtrace-run` wrapper to the command that brings the Flask server online. Locate the line `command: flask run --port=5001 --host=0.0.0.0"`. Update the command to `command: ddtrace-run flask run --port=5001 --host=0.0.0.0`. <p> `ddtrace-run` automates instrumentation of the service for Datadog APM. You can view more details for automatic and manual instrumentation using `ddtrace` in the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Datadog Python Trace and Profile Client</a> documentation.

6. Add labels to the logs. Click the code block below to copy the code. In the `docker-compose` file, highlight the comment `# add discounts log labels` and paste the code over the comment. 
```
       labels:
         com.datadoghq.ad.logs: '[{"source": "python", "service": "discounts-service"}]'
```{{copy}}

7. Click `docker-compose -f docker-compose-broken-no-apm-instrumentation.yml up -d`{{execute}} to restart the docker deployment to apply these changes. <p> The **discounts** section of the `docker-compose` file should now look like the screenshot below. <p> ![instrumented-discounts](instrumentapp2/assets/instrumented-discounts.png)

8. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in. <p> You should now see traces for the `discounts` service in the list. This may take a couple of minutes.

9. Click on a trace for the `discounts` service to view the Flame Graph, Span List, Tags, related Hosts, and related Logs.

#### Advertisements Service

Because the advertisements service also has a Python-Flask framework, the advertisements service has the same instrumentation as the discounts service. The ddtrace library has already been installed for you for this service (**Line 4** in `ads-service/requirements.txt`{{open}}).

1. Click `docker-compose-files/docker-compose-broken-no-apm-instrumentation.yml`{{open}}. 

2. Add the following environment variables for the service. Click the code block below to copy the code. In the `docker-compose` file, highlight the comment `# add ads env variables` and paste the code over the comment. 
```
         - DD_AGENT_HOST=agent
         - DD_LOGS_INJECTION=true
         - DD_ANALYTICS_ENABLED=true
```{{copy}}

3. Add the `ddtrace-run` wrapper to the command that brings the Flask server online. Locate `command: flask run --port=5002 --host=0.0.0.0"` and update the command to `command: ddtrace-run flask run --port=5002 --host=0.0.0.0`.  

4. Add labels to the logs. Click the code block below to copy the code. In the `docker-compose` file, highlight the comment `# add ads log labels` and paste the code over the comment. 
```
       labels:
         com.datadoghq.ad.logs: '[{"source": "python", "service": "advertisements-service"}]'
```{{copy}}

5. Click `docker-compose -f docker-compose-broken-no-apm-instrumentation.yml up -d`{{execute}} to restart the docker deployment to apply these changes. <p> The **advertisements** section of the `docker-compose` file should now look like the screenshot below. <p> ![instrumented-adverstisements](instrumentapp2/assets/instrumented-advertisements.png)

With these steps, the Python-based services are also instrumented for APM with Datadog. The following **Services** should now in the listed under the **Facets** to the left of the Traces list.

![trace-services](instrumentapp2/assets/trace-allservices.png)

The `postgres` service appears in the list because it is installed and automatically instrumented to support the discounts and advertisements services using **Line 12** in `discounts-service/requirements.txt`{{open}} and `ads-service/requirements.txt`{{open}}, respectively. You can view <a href="http://pypi.datadoghq.com/trace/docs/db_integrations.html#module-ddtrace.contrib.psycopg" target="_blank"> Datadog's Python tracing client</a> for more details. 