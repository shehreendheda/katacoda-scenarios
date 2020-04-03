Let’s view the trace and log data being collected by Datadog from the app.

1. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Login Now** in the “Congrats” email you received after you joined the account/organization. <p> Let’s first view the logs coming into the Log Explorer.

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs** in Datadog</a> and then move on to the next step. <p>If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Get Started**, then click **Start Trial** in the pop-up window. Select **Container**, then select the **docker** tile. Scroll to the bottom and click **Explore your Logs**.

3. In the list of **Facets** on the left, expand **Services** to view the services from the app that are injecting logs into Datadog. <p>![log-services](instrumentapp/assets/log-services.png) <p>These are the services that have logs enabled in the `docker-compose.yml`{{open}}.

4. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> in Datadog to view the list of traces that are coming in.

5. In the list of **Facets** on the left, expand **Services** to view the services from the app that are injecting traces into Datadog. <p>![trace-services](instrumentapp/assets/trace-services.png) <p> In addition to `store-frontend` service, you see three other services: <p> `store-frontend-cache` and `store-frontend-sqlite`, which are defined in **Line 3** in `store-frontend/config/initializers/datadog.rb`{{open}} for the `store-frontend` service. <p> `active-record`, which is installed and automatically instrumented to support the Ruby-on-Rails `store-frontend` service using **Line 7** in `store-frontend/config/application.rb`{{open}}. You can view the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#active-record" target="_blank"> Tracing Ruby Application</a> for more details.

6. Click on a trace for the `store-frontend` service to view the Flame Graph and Span List. <p> The color of each span is based on the associated service, listed on the right of the Flame Graph.

7. Below the Flame Graph, click each tab to see the Tags, related Hosts, and related Logs. <p> Under **Logs(#)**, you can see the `trace_id:###` tag assigned by Datadog to the trace and the list of logs that are correlated to the trace via the `trace_id:###` tag. To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/" target="_blank">Connect Logs and Traces</a> documentation
 
8. Click any of the logs. A new tab will open for the **Log Explorer** and the details for the log. <p> Notice the tag selected in the search field above the lists of logs is the `trace_id:###` for the specific trace.

As you can see, the agent and store-frontend service were successfully instrumented for APM and related log collection in Datadog. 

Now, let's instrument the Python-based services of the app.