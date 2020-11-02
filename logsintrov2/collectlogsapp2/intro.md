In this activity, you'll configure log collection for the services of an e-commerce application, Storedog. The application is deployed in a Docker (containerized) envirionment and has services with either Ruby/Rails or Python/Flask frameworks.

The final collected logs for each application service should have the following:
- The correct `source` value for the corresponding Integration and the correct `service` value for correlation with any associated trace data
- A list of Event Attributes for each log
- Direct links to any correlated trace data

To configure the log collection for the Storedog app, you will complete the following steps: