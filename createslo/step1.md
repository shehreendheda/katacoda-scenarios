# Instrumenting the App with Datadog

To get started, run the following command:

```
docker-compose up
```{{execute T1}}


Wait for `docker-compose up` in Terminal 1 to finish running. This may take a few minutes. The docker-compose.yml instruments the Datadog agent and app build for monitoring with Datadog. Click the docker-compose.yml file in the directory to the right to learn more. To learn more about the app build, browse the store-frontend, ads-service and the discount-service folder in the directory. 

Once docker-compose has finished, click the **storedog** tab to the right to view the app. As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart.

Let’s simulate some live user activity in the app so that you can capture all the relevant metrics in Datadog. Click the following to run the commands in a new terminal.

```
cd /ecommerce-observability
./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000"
```{{execute T2}}

To confirm that the environment is read, in Datadog, click **APM** > **Services**. You should see these services. You may need to wait and refresh the page until all these services are available.