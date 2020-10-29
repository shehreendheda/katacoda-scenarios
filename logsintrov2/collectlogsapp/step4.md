The `store-frontend` service has a Rails framework. The first step for log collection configuration is to install the required Ruby log libraries. Next, an initializer file is added to send logs to Datadog in JSON format and to automatic injection of trace IDs and span IDs to correlate log and trace data. Finally, the docker-compose file is updated with more configuration parameters. 

The store-frontend service has already been configured for log collection and trace ID injection for you, but you will need to update the docker-compose file with the correct configuration parameters. Let's first go through the service configuration.

1. Click `store-frontend-instrumented-fixed/store-frontend/Gemfile`{{open}} to view the Gemfile for the store-frontend. The Gemfile installs the required tracing and log collection libraries.

    **Line 48** installs the `logging-rails` Gem, which is a railtie for integrating the Ruby logging framework into the Rails application. To learn more, view the <a href="https://github.com/TwP/logging-rails" target="_blank">logging-rails</a> documentation. 

    **Line 49** installs the `lograge` Gem to send logs to Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/log_collection/ruby/#setup" target="_blank">Rails log collection</a> documentation. 

2. Click `store-frontend-instrumented-fixed/store-frontend/config/initializers/lograge.rb`{{open}} to view the configuration file that converts the logs to the JSON format . To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation. 

    Notice that the `custom_options` block (**Lines 6-16**) set certain parameters including the `trace_id` and `span_id`. This enable automatic trace ID injection into logs to correlate log and trace data. (More details in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#manual-lograge" target="_blank">Trace correlation > Manual(Lograge)</a> documentation.)

    As you saw in the previous page, logs from the `store-frontend` service are being collected and processed by Datadog. The last step for completing log collection configuration is setting the `source` and `service` parameters for the logs in the docker-compose file. 

3. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}}.

4. Click **Copy to Editor** below to add the following logs configuration label under `frontend`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add frontend log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'</pre>

    With these steps, the Rails `store-frontend` service is configured Log Management with Datadog. The **frontend** section of the docker-compose file should now look like the screenshot below. 

    ![instrumented-frontend](collectlogsapp/assets/instrumented-frontend.png) 

5. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment.

6. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>. 

7. When new logs for the `store-frontend` service start displaying in the Log Explorer (Hint: Check the timestamp.), click a `store-frontend` log that has a structure that is similar to the one shown below.

    ![frontend-example-log](collectlogsapp/assets/frontend-example-log.png)

    The Log Side Panel with the log details will open.
   
    ![store-frontend-log-final](collectlogsapp/assets/store-frontend-log-final.png)

    Notice that the `source` value is now `ruby` and the `service` value is now `store-frontend`, based on the label you added in step 4.


The `store-frontend` logs are now configured as needed. The logs have the correct `source` and `service` tags, the logs are processed, and the logs are correlated with associated traces. Let's complete configuration for the `discounts-service` and `advertisements-service`.