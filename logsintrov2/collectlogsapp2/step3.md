When you viewed the logs collected for the `ecommerce-frontend`, you noticed three features about the log details (example in the image below).

- The `source` and `service` tags were not assigned as needed.
- The **Event Attributes** were processed and listed.
- There were traces correlated with the logs.

![ecommerce-frontend-log2](collectlogsapp/assets/ecommerce-frontend-log2.png)

The service has already been configured so that emitted logs are processed and are tagged with the corresponding trace_IDs and span_IDs, but you will need to update the docker-compose file with the correct `source` and `service` configuration parameters. Let's first go through the service configuration.

The service has a Ruby/Rails framework. For the first step in log collection configuration, the required Ruby log libraries were installed. Next, an initializer file was added to send logs to Datadog in the JSON format and to automatically injection of trace IDs and span IDs to correlate log and trace data. 

1. Click `store-frontend-instrumented-fixed/store-frontend/Gemfile`{{open}} to view the Gemfile for the store-frontend. The Gemfile installs the required tracing and log collection libraries.

    **Line 48** installs the `logging-rails` Gem, which is a railtie for integrating the Ruby logging framework into the Rails application. To learn more, view the <a href="https://github.com/TwP/logging-rails" target="_blank">logging-rails</a> documentation. 

    **Line 49** installs the `lograge` Gem to send logs to Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/log_collection/ruby/#setup" target="_blank">Rails log collection</a> documentation. 

2. Click `store-frontend-instrumented-fixed/store-frontend/config/initializers/lograge.rb`{{open}} to view the configuration file that converts the logs to the JSON format . To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation. 

    Notice that the `custom_options` block (**Lines 6-16**) set certain parameters: (More details in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#manual-lograge" target="_blank">Trace correlation > Manual(Lograge)</a> documentation.) 
    
    `dd.trace_id` and `dd.span_id` are <a href="https://docs.datadoghq.com/logs/processing/#trace_id-attribute" target="_blank">attributes</a> that enable automatic `trace_ID` and `span_ID` tag injection into logs to correlate log and trace data. 
        
    `ddsource` is the <a href="https://docs.datadoghq.com/logs/processing/#source-attribute" target="_blank">attribute</a> defines the log source. Datadog's Autodiscovery recognizes the attribute and uses the corresponding Integration and Integration Pipeline to collect and process the logs.

    As you saw in the previous page, logs from the service are being collected and processed by Datadog. The last step for completing log collection configuration is setting the correct `source` and `service` parameters for logs in the docker-compose file. 

3. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}} to open the docker-compose file.

4. Click **Copy to Editor** below to add the following logs configuration label under `frontend`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add frontend log labels">
       labels:
         com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'</pre>

    With these steps, the Rails `store-frontend` service is configured for Log Management with Datadog. The **frontend** section of the docker-compose file should now look like the screenshot below. 

    ![instrumented-frontend](collectlogsapp/assets/instrumented-frontend.png)

    Let's restart the deployment and view the log details for the service.

5. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment.

6. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, and make sure `env:ruby-shop` is the search query. 

7. When logs for the `store-frontend` service start displaying in the Log Explorer, click a `store-frontend` log that has a structure that is similar to the one shown below.

    ![frontend-example-log](collectlogsapp/assets/frontend-example-log.png)

    The Log Side Panel with the log details will open.
   
    ![store-frontend-log-final](collectlogsapp/assets/store-frontend-log-final.png)

    Notice that the `source` value is now `ruby` and the `service` value is now `store-frontend`, based on the label you added in step 4. 
    
    The `source` tag now matches the `ddsource` attribute in the logs. This is ensures that the `ruby` Integration and Integration Pipelines are used to collect and process the logs.

    The `service` tag for the logs now matches the `DD_SERVICE` environment variable that sets the service name for the trace data. When you click the `service` tile in the log and select **Go to APM service page**, you will be redirected to the **Service List** filtered on `store-frontend`.

The `store-frontend` logs are now configured as needed. The logs have the correct `source` and `service` tags, the logs are processed, and the logs are correlated with associated traces. Let's complete configuration for the `discounts-service` and `advertisements-service`.