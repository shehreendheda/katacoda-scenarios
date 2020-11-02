In the terminal on the right, the Storedog app is being deployed using Docker. Live traffic to the app is also being simulated. This may take up to 3 minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

1. When files appear in the editor directory on the right, click `docker-compose-files/docker-compose-no-logs.yml`{{open}} to view the file in the editor. 

     This docker-compose file instruments the Datadog agent and app services for monitoring with Datadog. 
     
     All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

     Because the application is run in a Docker (containerized) environment, the Datadog Agent runs in a container alongside the application containers: `agent`. 
     
     Each application service runs in its own Docker container: `discounts`, `frontend`, `advertisements`, and `db`.

     Metric and trace collection has been configured, but log collection is not yet configured.

2. Once you see the `The environment is prepared!` message, click the **storedog** tab above the terminal to view the Storedog app. 

     Clicking around inside the app, you can see it includes a home page, product pages, advertisements, discounts, and a shopping cart.

     Let's make sure that the Datadog is collecting metric and trace data from the app as expected.

3. In a new window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com.

     Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM > Traces** </a> to view the list of traces that are being ingested. 

     In the search field, enter `env:ruby-shop` if it is not listed so that the traces list displays traces for the toredog app only.

     In the **Facets** list, expand **Service**. The list of services from the app that are injecting traces into Datadog should look like the list in the image.

     ![trace-services](collectlogsapp2/assets/trace-allservices.png)

With Datadog collecting metric and trace data from the app, let's enable log collection.