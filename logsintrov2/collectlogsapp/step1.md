
In the terminal on the right, the Storedog app is being deployed using Docker. Live traffic to the app is also being simulated. This may take up to 3 minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

In this activity, you'll walkthrough instrumentation of the  store-frontend (home page), discounts, and advertisements services for APM in Datadog. But first, let's enable trace and log collection for the Datadog Agent.

1. Click `docker-compose-files/docker-compose-fixed-instrumented.yml`{{open}} to view docker-compose file that brings the Storedog app online and enables metric, trace and log collection via the Datadog agent.

     All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

     Each application service runs in its own Docker container: `discounts-service`, `thinker`, `redis`, and `nginx`.

     Because the application is run in a Docker (containerized) environment, the Datadog Agent also runs in a container alongside the other containers: `datadog`. 

     Metric and trace collection has been configured, but log collection is not yet configured.

     <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation" target="_datadog">Log collection</a> has to be enabled for the Datadog Agent so that logs from the Agent container as well as the application services containers can be collected by Datadog.

2. 

`clear`{{execute}}