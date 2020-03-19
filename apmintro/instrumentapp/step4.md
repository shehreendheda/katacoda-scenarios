The `discounts` and `advertisements` services have a Python-Flask framework, so the service has been instrumented using the Python tracing library `dd-trace`. First, the `dd-trace` library is added to the list of required libraries, and then, the docker-compose.yml is updated for trace injection, log injections and App Analytics for each service.

#### Discounts Service

1. Click `discounts-service/requirements.txt`{{open}} to view the `dd-trace` library (**Line 4**) in the list of required libraries that are installed for the service.

2. Click `docker-compose.yml`{{open}}. <p> **Line 27** defines the address of the Agent that the tracer submits to. <p>**Line 28** enables automatic injection of trace IDs into the logs from the supported logging libraries to correlate traces and logs. <p>**Line 29** enables App Analytics for the traces. <p> **Line 31** is the command that brings up the Flask server `flask run --port=5001 --host=0.0.0.0`. The command is wrapped with `ddtrace-run` to automate instrumentation. You can view more details for automatic and manual instrumentation using `ddtrace` in the <a href="http://pypi.datadoghq.com/trace/docs/web_integrations.html#flask" target="_blank">Datadog Python Trace and Profile Client</a> documentation. <p> **Lines 39 and 40** allow Datadog to identify the log source for the container and automatically install the corresponding integration.  

#### Advertisements Service
1. Click `ads-service/requirements.txt`{{open}} to view the `dd-trace` library (**Line 4**)  in the list of required libraries that are installed for the service.

2. Click `docker-compose.yml`{{open}}. <p> **Line 68** defines the address of the Agent that the tracer submits to. <p>**Line 69** enables automatic injection of trace IDs into the logs from the supported logging libraries. <p>**Line 70** enables App Analytics for the traces. <p> **Line 72** is the command that brings up the Flask server `flask run --port=5002 --host=0.0.0.0`. The command is wrapped with `ddtrace-run` to automate instrumentation. <p> **Lines 80 and 81** allow Datadog to identify the log source for the container and automatically install the corresponding integration. 

With these steps, the Python-based services are instrumented for APM with Datadog. By now, the environment should be prepared. Let's log in to Datadog to view the trace and logs for the app.
