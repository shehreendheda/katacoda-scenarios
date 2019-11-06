To get started, let's get the app set up for monitoring with Datadog.

1. Click `instrument`{{execute T1}} to instrument the Datadog agent and storedog app for monitoring with Datadog using a docker-compose.yml. 
2. Wait for the docker-compose.yml to finish running. This may take about 3 minutes. <p> To learn more about the Datadog instrumentation and Storedog app build, you can browse the docker-compose.yml file and store-frontend, ads-service and the discount-service folders in the directory to the right. 
3. Click the **storedog** tab to the right. You should be able to view the app once docker-compose has finished. <p> As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart. <p> Let’s simulate live user activity in the app so that you can capture all the relevant metrics in Datadog. 

4. Click `traffic`{{execute T2}} to create traffic to the app in an infite loop using GoReplay. (This command runs in Terminal 2.)
5. Navigate to <a href="https://app.datadoghq.com/apm/" target="_datadog">**APM** > **Services**</a> in Datadog. <p> If you are working in a new Datadog Organization, click **Get Started** in the APM page. Then, in the main menu, click the **APM > Services** to see the list of Services.

You should see the services below in the list. You may need to wait about 2 minutes after running the `traffic` command and refresh the page until all these services are available.

![Service List](createslo/assets/service-list.png)