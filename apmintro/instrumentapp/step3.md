The `frontend` service has a Ruby on Rails (Spree) framework. The first step for instrumentation is to install the required Ruby tracing and log collection libraries. Next, an initializer file as added to enable Rails instrumentation. Finally, the docker-compose.yml is updated to enable APM and log for the frontend service. 

1. Click `store-frontend/Gemfile`{{open}} to view the Gemfile for the store frontend. The Gemfile installs the required tracing and log collection libraries.<p> **Line 46** installs the `ddtrace` Gem, which is <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Datadog’s tracing client for Ruby</a>. <p>**Line 48** installs the `logging-rails` Gem, which is a railtie for integrating the Ruby logging framework into the Rails application. To learn more, view the <a href="https://github.com/TwP/logging-rails" target="_blank">logging-rails</a> documentation. <p>**Line 49** installs the `lograge` Gem to send logs to Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/log_collection/ruby/#setup" target="_blank">Ruby on Rails log collection</a> documentation.


2. Click `store-frontend/config/initializers/datadog.rb`{{open}} to view the initializer file that enables Rails instrumentation. <p>**Line 3** activates autoinstrumentation for Rails. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#rails" target="_blank">Tracing Ruby Applications - Rails integration instrumentation</a> documentation. <p>**Line 5** makes sure requests are also instrumented. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#net-http" target="_blank">Tracing Ruby Applications - Net/HTTP integration instrumentation</a> documentation. <p>**Line 6** allows you to update the default behavior of the Datadog tracer. You can view the definitions of each option in the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#advanced-configuration" target="_blank">Tracing Ruby Applications - Tracer settings ddvanced configuration </a> documentation.

3. Click `docker-compose.yml`{{open}}. 

**Line 43** defines the address of the Agent that the tracer submits to.

**Line 44** enables automatic injection of trace IDs in logs for the supported logging libraries.

**Line 45** enables APP Analytics for the traces.