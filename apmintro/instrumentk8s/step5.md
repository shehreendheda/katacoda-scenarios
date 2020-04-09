Now that the Datadog Agent is instrumented, let's start the Agent and explore the traces and related logs in Datadog.

1. Click `kubectl apply -f datadog/datadog-agent.yaml`{{execute}} to start the datadog agent.

2. Click `kubectl get pods` to check if the datadog-agent pod is running. <p> If the agent pod is not running, wait a few seconds and click the command again. You may need to do this more than once until the pod is running.

3. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Login Now** in the “Congrats” email you received after you joined the account/organization.

4. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. <p> If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Get Started**, then click **Start Trial** in the pop-up window. Select **Container**, then select the **docker** tile. Scroll to the bottom and click **Explore your Logs**.

5. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in.

6. In the list of Facets on the left, expand **Services** to view the services from the app that are injecting logs into Datadog. <p>![trace-services](instrumentapp/assets/trace-services.png) <p> In addition to `store-frontend`, `advertisements`, and `discounts` services, you see four other services: <p>`postgres`, which is installed and automatically instrumented for the python-based services discounts and advertisements using **Line 12** in `discounts-service/requirements.txt`{{open}} and `ads-service/requirements.txt`{{open}}, respectively. You can view <a href="http://pypi.datadoghq.com/trace/docs/db_integrations.html#module-ddtrace.contrib.psycopg" target="_blank"> Datadog's Python tracing client</a> for more details. <p> `store-frontend-cache` and `store-frontend-sqlite` because of **Line 3** in `store-frontend/config/initializers/datadog.rb`{{open}} for the `store-frontend` service. <p>`active-record`, which is installed and automatically instrumented to support the Ruby-on-Rails `store-frontend` service using **Line 7** in `store-frontend/config/application.rb`{{open}}. You can view the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#active-record" target="_blank"> Tracing Ruby Application</a> for more details.

7. Click on a trace for the `store-frontend` service to view the Flame Graph and Span List. <p> The color of each span is based on the associated service, listed on the right of the Flame Graph.

8. Below the Flame Graph, click each tab to see the Tags, related Hosts, and related Logs. <p> Under **Logs(#)**, you can see the `trace_id:###` tag assigned by Datadog to the trace and the list of logs that are correlated to the trace via the `trace_id:###` tag. To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/" target="_blank">Connect Logs and Traces</a> documentation
 
9. Click any of the logs. A new tab will open for the **Log Explorer** and the details for the log. <p> Notice the tag selected in the search field above the lists of logs is the `trace_id:###` for the specific trace.

10. Repeat steps 7-9 for the discounts service and advertisements service.

As you can see, using the steps outlined in this activity, the Storedog app was successfully instrumented for APM and related log collection in Datadog. 