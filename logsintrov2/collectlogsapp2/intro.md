In this activity, you'll configure log collection for the services of an e-commerce application, Storedog. The application is deployed in a Docker (containerized) envirionment, so the containerized Datadog Agent will be used. The `strore-frontend` service of the Storedog app has a Ruby/Rails frameworks and the `discounts` and `advertisements` services have Python/Flask frameworks. You'll see that different the different language framework require different approaches to log collection configuration.


To configure the log collection for the Storedog app, you will complete the following steps:
1. Preparing the Environment
2. Enabling Log Collection by the Datadog Agent
3. Configuring Log Collection for a Ruby App Service
4. Configuring Log Collection for Python App Services
5. Exploring Collected Logs in Datadog


The final collected logs for each application service will have the following:
- The correct `source` tag for the corresponding Integration and the correct `service` tag for correlation with any associated trace data
- A list of processed Event Attributes for each log
- Direct correlation to any associated trace data


When you are ready to continue, click **Start Scenario**.
