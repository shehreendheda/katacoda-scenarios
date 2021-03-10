In this activity, you'll configure log collection for the services of an e-commerce app, Storedog. The app is deployed in a Docker (containerized) envirionment, so the containerized Datadog Agent will be used. The `store-frontend` service of the Storedog app has a Ruby/Rails framework and the `discounts` and `advertisements` services have Python/Flask frameworks. You'll see that the different language frameworks require different approaches to log collection configuration.

To configure the log collection for the Storedog app, you will complete the following steps:
1. Preparing the Environment
2. Enabling Log Collection by the Datadog Agent
3. Configuring Log Collection for Ruby App Services
4. Configuring Log Collection for Python App Services
5. Exploring Collected Logs in Datadog

The final collected logs for each application service will have the following:
- The correct `source` tag for the corresponding Integration Pipeline and the correct `service` tag for correlation with associated trace data
- A list of processed Event Attributes for each log
- Direct correlation to associated trace data
- Direct correlation to associated host metric data

When you are ready to continue, click **Start Scenario**.
