Before you create the SLO for successful views of the home page, let’s view the metrics for the requests to view the home page.

1. In <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services** in Datadog</a>, click the **store-frontend** service.
2. Scroll down to the list of **Endpoints** and click **Spree::HomeController#index**.
3. Expand the graphs for **Total Requests** and **Total Errors**. Below the graph, note the metrics listed below each graph.

If there are no request errors, the metric that relates to request errors to view the home page may not be listed. As you will see in the following step, the metric is *trace.rack.request.errors*.

Now, let’s create the Event Based SLO that 99.9% of requests to view the home page over 30 days are successful.

1. In <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives** in Datadog</a>, click **New SLO**. 
2. Under **Define the source**, select **Event Based**.
3. Update the fields under Good Events and Total Events as shown below. 

![Events List](actionslos/assets/ebslo-homepage.png)

Note: As shown below, click **avg by** to update to **sum by** for each. Click Advanced and then Add Query to add the second metric.

![Events Selection](actionslos/assets/ebslo-goodevents.gif)

4. Under **Set your targets**, click **Set Target +** and set **Target:** to **99%** and **Time Window:** to **30 Days**.
5. Under **Add names and tags**, enter **Home Page Views** for **Name:** and **99% of home page view requests are successful over 30 days** for **Description**.
6. Click **Save**.
7. In the **Service Level Objectives** list, click the SLO you just created to view the details, status and history.

Notice that the error budget is green and >99.9% requests to view the home page are currently successful.