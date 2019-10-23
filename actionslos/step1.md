To get started, 

1. Click `instrument`{{execute T1}} to instrument the Datadog agent and storedog app for monitoring with Datadog using a docker-compose.yml. 
2. Wait for the docker-compose.yml to finish running. 

This may take about 3 minutes. 

Once docker-compose has finished, click the **storedog** tab to the right to view the app. As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart.

Let’s simulate some live user activity in the app so that you can capture all the relevant metrics in Datadog. 

Click `traffic`{{execute T2}} to create traffic to app in an infite loop using GoReplay. 

To confirm that the environment is ready, navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services** in Datadog</a>. You should see the services below in the list. You may need to wait about 2 minutes after running the `traffic` command and refresh the page until all these services are available.

![Service List](actionslo/assets/service-list.png)