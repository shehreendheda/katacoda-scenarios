# Instrumenting the App with Datadog

To get started, run the following command:

```
docker-compose up
```{{execute T1}}


Wait for `docker-compose up` in the terminal to finish running. This may take about 3 minutes. The docker-compose.yml instruments the Datadog agent and app build for monitoring with Datadog. Click the docker-compose.yml file in the directory to the right to learn more. To learn more about the app build, browse the store-frontend, ads-service and the discount-service folders in the directory. 

Once docker-compose has finished, click the **storedog** tab to the right to view the app. As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart.

Let’s simulate some live user activity in the app so that you can capture all the relevant metrics in Datadog. 

1. Click the **+** sign next to the **storedog** tab on the right and select **Open New Terminal**. 
2. Click the following to run the commands in the new terminal.

```
cd /create-slo
./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000"
```{{execute T2}}

To confirm that the environment is ready, in Datadog, click **APM** > **Services**. You should see the services below in the list. You may need to wait about 2 minutes after running the previous command and refresh the page until all these services are available.

![Service List](createslo/assets/services-list.png)