Let’s view the metrics for the requests to view the home page. Then, create the Event Based SLO that 99% of requests to view the home page over 30 days are successful.

1. In <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index**</a>, expand the graphs for **Total Requests** and **Total Errors**. 

2. Observe the metrics listed below each graph. <p> Note: The metric for errors to view the home page, *trace.rack.request.errors*,  may not be listed yet if there have been no errors.

3. In <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives**</a> in Datadog, click **New SLO**.

4. Under **Define the source**, select `Event Based`.

5. Update the fields under **Good Events** and **Total Events** as shown below. <p> ![Events List](actionslos/assets/ebslo-homepage.png) <p> Note: As shown below, click **avg by** to update to **sum by** for each. Click **Advanced** and then **Add Query** to add the second metric. <p> ![Events Selection](actionslos/assets/ebslo-goodevents.gif)

6. Under **Set your targets**, click **Set Target +**. Set **Target:** to `99%` and **Time Window:** to `30 Days`.

7. Under **Add names and tags**, enter `Home Page Latency` for **Name:**, `99% of requests to view the home page are successful` for the description, and  `service:storefrontend` and `resource_name:spree::homecontroller_index` for **Tags:**.

8. Click **Save**.

9. In the **Service Level Objectives** list, click the SLO you just created to view the details, status, and history. <p> Note that the status of the SLI and the remaining error budget.