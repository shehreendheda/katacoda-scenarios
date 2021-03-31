The `store-frontend` service has already been configured so that emitted logs are processed and are tagged with the corresponding trace_IDs and span_IDs, but you will need to update the docker-compose file with the correct `source` and `service` tags. Let's first go through the service configuration.

The service has a Ruby/Rails framework. For the first step in log collection configuration, the required Ruby log libraries have been installed. Next, an initializer file has been added to send logs to Datadog in the JSON format and to automatically injection of trace IDs and span IDs to correlate log and trace data. 

1. Click `store-frontend-broken-instrumented/store-frontend/Gemfile`{{open}} to view the Gemfile for the store-frontend. The Gemfile installs the required tracing and log collection libraries.

    **Line 48** installs the `logging-rails` Gem, which is a railtie for integrating the Ruby logging framework into the Rails application. To learn more, view the <a href="https://github.com/TwP/logging-rails" target="_blank">logging-rails</a> documentation. 

    **Line 49** installs the `lograge` Gem to send logs to Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/log_collection/ruby/#setup" target="_blank">Rails log collection</a> documentation. 

2. Click `store-frontend-broken-instrumented/store-frontend/config/initializers/lograge.rb`{{open}} to view the configuration file that converts the logs to the JSON format . To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation. 

    Notice that the `custom_options` block (**Lines 6-16**) set certain parameters: (More details in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#manual-lograge" target="_blank">Trace correlation > Manual(Lograge)</a> documentation.) 
    
    `dd.trace_id` and `dd.span_id` are <a href="https://docs.datadoghq.com/logs/processing/#trace_id-attribute" target="_blank">attributes</a> that enable automatic `trace_ID` and `span_ID` tag injection into logs to correlate log and trace data. 
        
    `ddsource` is the <a href="https://docs.datadoghq.com/logs/processing/#source-attribute" target="_blank">attribute</a> defines the log source. Datadog's Autodiscovery recognizes the attribute and uses the corresponding Integration and Integration Pipeline to collect and process the logs.

    With the app service configured, the last step for completing log collection configuration is adding the correct `source` and `service` tags for logs in the docker-compose file. 

3. Click `deploy/docker-compose/docker-compose-no-logs.yml`{{open}} to open the docker-compose file.

4. Click **Copy to Editor** below to add the following logs configuration label under `frontend`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add frontend log labels">
         com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'</pre>

    The `frontend` section of the docker-compose file should now look like the screenshot below. 

    ![instrumented-frontend](collectlogsapp2/assets/instrumented-frontend.png)


With these steps, the Ruby/Rails `store-frontend` service is configured as needed for Log Management as needed. 
- The logs will have the correct `source` and `service` tags.
- The logs will be processed using the `ruby` Integration Pipeline.
- The logs will be correlated with associated traces using the `trace_id` tag. 

Let's now complete configuration for the `discounts` and `advertisements` services.