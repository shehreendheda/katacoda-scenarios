The `store-frontend` service has already been configured so that emitted logs are processed and tagged with the corresponding trace_IDs and span_IDs, but you will need to update the docker-compose file with the correct `source` and `service` tags. Let's first go through the service configuration.

The service has a Ruby/Rails framework. For the first step in log collection configuration, the required Ruby log libraries have been installed. Next, an initializer file has been added to send logs to Datadog in the JSON format and to automatically injection of trace IDs and span IDs to correlate log and trace data. 

1. Click `store-frontend-broken-instrumented/Gemfile`{{open}} to view the Gemfile for the store-frontend. The Gemfile installs the required tracing and log collection libraries.

    **Line 49** installs the `rails_semantic_logger` Gem, which is a feature rich logging framework and replacement for existing Rails loggers. The Semantic Logger adds contextual information to every log entry. To learn more, view the <a href="https://github.com/rocketjob/rails_semantic_logger/tree/47112b2c9effe7ab72f4f99d46875ed8d67d0965" target="_blank">rails_semantic_logger</a> documentation. 

2. Click `store-frontend-broken-instrumented/config/environments/development.rb`{{open}} to view the configuration file the store-frontend service. To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation. 

    Details for the logging configuration can be found in **Lines 69-104** 
    
    **Lines 91-102**, in particular, add `dd.trace_id`, `dd.span_id`, `dd.env`, `dd.service`, and `dd.version` attributes to the logs that are identified in Datadog as the specific tags and that you can use for searching and filtering the logs and correlating them to metrics and trace data. To learn more, view the <a href="https://docs.datadoghq.com/tracing/connect_logs_and_traces/ruby/?tab=lograge#automatic-trace-id-injection" target="_blank">Connecting Ruby Logs and Traces</a> documentation.

3. With the app service configured, the last step for completing log collection configuration is adding the correct `source` and `service` tags for logs in the docker-compose file. 

    Click `deploy/docker-compose/docker-compose-no-logs.yml`{{open}} to open the docker-compose file.

    Click **Copy to Editor** in the block below or manually copy and paste the text where indicated to add the following logs configuration label under `frontend`.

    <pre class="file" data-filename="docker-compose-no-logs.yml" data-target="insert" data-marker="# add frontend log labels">
         com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'</pre>

    The `frontend` section of the docker-compose file should now look like the screenshot below. 

    ![instrumented-frontend](collectlogsapp2/assets/instrumented-frontend.png)


With these steps, the Ruby/Rails `store-frontend` service is configured as needed for Log Management. 
- The logs will have the correct `source` and `service` tags.
- The logs will be processed using the `ruby` Integration Pipeline.
- The logs will be correlated with associated traces using the `trace_id` tag. 

Let's now complete configuration for the `discounts` and `advertisements` services.