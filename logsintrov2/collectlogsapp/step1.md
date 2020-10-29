In the terminal on the right, the Storedog app is being deployed using Docker. Live traffic to the app is also being simulated. This may take up to 3 minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

1. Click `docker-compose-files/docker-compose-no-logs.yml`{{open}} to view the file in the editor on the right. 

     This docker-compose file instruments the Datadog agent and app services for monitoring with Datadog. 
     
     Browse the file to view the details of the deployment. As you can see, there are no specifications for APM or log collection. Although the focus of the activity is log collection, you'll also instrument the services for APM to 

2. Once you see the `The environment is prepared!` message, click the **storedog** tab above the terminal to view the Storedog app. <p> Clicking around inside the app, you can see it includes a home page, product pages, advertisements, discounts, and a shopping cart. <p> 

In this activity, you will go through instrumentation of the  store-frontend (home page), discounts, and advertisements services for APM in Datadog. But first, let's enable trace and log collection for the Datadog Agent.