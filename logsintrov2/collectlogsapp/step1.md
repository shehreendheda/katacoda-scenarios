In the terminal on the right, the Storedog app is being deployed using Docker. Live traffic to the app is also being simulated. This may take up to 3 minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}} to view the file in the editor on the right. 

     This docker-compose file instruments the Datadog agent and app services for monitoring with Datadog. 
     
     All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

     Each application service runs in its own Docker container: `discounts`, `frontend`, `advertisements`, and `db`.

     Because the application is run in a Docker (containerized) environment, the Datadog Agent also runs in a container alongside the other containers: `datadog`. 

     Metric and trace collection has been configured, but log collection is not yet configured.

2. Once you see the `The environment is prepared!` message, click the **storedog** tab above the terminal to view the Storedog app. 

     Clicking around inside the app, you can see it includes a home page, product pages, advertisements, discounts, and a shopping cart. 

In this activity, you will go through instrumentation of the  store-frontend (home page), discounts, and advertisements services for APM in Datadog. But first, let's enable trace and log collection for the Datadog Agent.