The `store-frontend` service has a Ruby-on-Rails framework. The first step for instrumentation is to install the required Ruby tracing and log collection libraries. Next, an initializer file is added to enable Rails instrumentation. A configuration file is also added to ship logs to Datadog in JSON format so that Datadog can filter the logs based on special parameters. Finally, the docker-compose.yml is updated to log injection and App Analytics for the frontend service. 

The service has been instrumented for you, but you will enable log collection and app analytics for the store-frontend.

1. Click `store-frontend/Gemfile`{{open}} to view the Gemfile for the store-frontend. The Gemfile installs the required tracing and log collection libraries.<p> **Line 46** installs the `ddtrace` Gem, which is <a href="https://docs.datadoghq.com/tracing/setup/ruby/" target="_blank">Datadog’s tracing client for Ruby</a>. The `ddtrace` library traces requests as they flow across web servers, databases, and microservices so that developers have high visibility into bottlenecks and troublesome requests. <p>**Line 48** installs the `logging-rails` Gem, which is a railtie for integrating the Ruby logging framework into the Rails application. To learn more, view the <a href="https://github.com/TwP/logging-rails" target="_blank">logging-rails</a> documentation. <p>**Line 49** installs the `lograge` Gem to send logs to Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/log_collection/ruby/#setup" target="_blank">Ruby on Rails log collection</a> documentation.

2. Click `store-frontend/config/initializers/datadog.rb`{{open}} to view the initializer file that enables Rails instrumentation. <p>**Line 3** activates autoinstrumentation for Rails, enabling trace collection from the service. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#rails" target="_blank">Tracing Ruby Applications - Integration Instrumentation - Rails</a> documentation. <p>**Line 5** makes sure requests are also instrumented. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#net-http" target="_blank">Tracing Ruby Applications - Integration Instrumentation - Net/HTTP</a> documentation. <p>**Line 6** allows you to update the default behavior of the Datadog tracer. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#advanced-configuration" target="_blank">Tracing Ruby Applications - Advanced Configuration - Tracer Settings</a> documentation.

3. Click `store-frontend/config/environments/development.rb`{{open}} to view the configuration file that converts the logs to the JSON format using **Lines 11-28**. To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation. <p> With the service instrumented and trace collection automatically enabled via the datadog.rb initializer file, you can finish enabling log collection and App Analytics for the service.

4. Click `docker-compose.yml`{{open}}. 
5. Under the **frontend** service (**Line 36**), copy/paste the following lines in the `environment:` list. Make sure the new lines have the same indent as **Line 38**.
```
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true
```{{copy}} <p> `DATADOG_TRACE_AGENT_HOSTNAME` defines the address of the Agent that the tracer submits to (similar to **Line 6** in `store-frontend/config/initializers/datadog.rb`{{open}}). <p> `DD_LOGS_INJECTION` enables automatic injection of trace IDs into the logs from the supported logging libraries to correlate traces and logs. <p> `DD_ANALYTICS_ENABLED` enables App Analytics for the traces.
6. Under the **frontend** service (**Line 36**), copy/paste the following lines below the `volumes` list. <p> Note: Make sure `labels:` has the same indent as `volumes:`. 
```
    labels:
      - com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'
```{{copy}} <p> As for the datadog Agent, these lines allow Datadog to identify the log source for the container and automatically install any corresponding integration. <p> The **frontend** portion of the `docker-compose.yml` should now look like ![instrumented-frontend](instrumentapp2/assets/instrumented-frontend.png) <p> With these steps, the Ruby-on-Rails `store-frontend` service is instrumented for APM and Log management with Datadog. Let's restart the docker deployment to apply these changes.

7. Click `docker-compose up -d`. <p> ![restarted-agent-frontend](instrumentapp2/assets/restarted-agent-frontend.png)

Before instrumenting the discounts and advertisements services, let's log into Datadog and see Now, let's go over instrumentation for the Python-based services of the app.