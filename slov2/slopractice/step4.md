<a href="https://docs.datadoghq.com/monitors/service_level_objectives/monitor/" target="_blank">Monitor Based SLOs</a> take a time-based approach to tracking SLIs. The SLO target is the proportion of the time window all the monitors should be in the OK state. 

Because latency is time-based, you'll create a Monitor Based SLO to track latency for viewing the home page.

SLO:
*`"Over the past 7-days, 99% of the time the p99 latency of a home page request should be less than 5 seconds."`*

Note: The SLO targets and time windows in this activity are just arbitrary. In real-world situations, various teams (Product, Engineering, Executive, etc.) would collaborate to determine SLO details.

The SLI for this SLO will be a monitor that tracks the trace metric for p99 latency (`trace.rack.request.duration.by.resource_service.99p`) of the **Spree::HomeController#index** resource in the **store-frontend** service. 

## Creating the Monitor for the SLI

1. Navigate to <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **New Monitor**</a> and select **APM**.

   The <a href="https://docs.datadoghq.com/monitors/monitor_types/apm/?tab=apmmetrics" target="_blank">APM Monitor</a> is designed specifically for trace metrics. After you create the monitor, you'll see that the underlying monitor for the APM Monitor is a <a href="https://docs.datadoghq.com/monitors/monitor_types/metric" target="_blank">Metric Monitor</a> for the trace metric.

2. Expand **Select monitor scope**.
   
   Select `APM Metrics`. 
   
   Select `store-frontend` for **Service:**.
   
   Select `spree::homecontroller_index` for **Resource:**.

   ![monitor-new-scope](slopractice/assets/monitor-new-scope.png)

3. Expand **Set alert conditions**.

   Select `Threshold Alert`. 
   
   Set the alert criteria to **Alert when the** `p99 latency` **is** `above` `5` **over the last** `1 minutes`.

   ![monitor-new-conditions](slopractice/assets/monitor-new-conditions.png)

4. Expand **Say what’s happening**.

   Leave the name the monitor as is.
   
   Add `Monitor for the SLO "99% of the time the p99 latency of a home page request should be less than 5 seconds."`{{copy}} to the description.

   ![monitor-new-whatshappening](slopractice/assets/monitor-new-whatshappening.png)

5. Make sure the **Notify your team** field is blank and `Do not notify` is selected. No notifications are needed in this activity.

   ![monitor-new-notification](slopractice/assets/monitor-new-notification.png)

6. Click **Save**. You'll be redirected to the monitor details. Browse the page.

   Notice the metric query details: the `trace.rack.request.duration.by.resource_service.99p` metric is scoped to the respective `env`, `service`, and `resource_name`.
   
   Notice that **Tags** have been automaically added for the corresponding `env`, `service`, and `resource_name`. You can use these tags to search the monitors in the Manage Monitors list. These tags also link the monitor to corresponding APM Service and Resource pages.

Now that you've created the monitor. Let's create the Monitor Based SLO.

## Creating the Monitor Based SLO

1. Navigate to <a href="https://app.datadoghq.com/slo/new" target="_datadog">**Monitor** > **New SLO**</a>.

2. Under **Define the source**, select **Monitor Based**, then select the monitor you created above, `Service store-frontend on resource_name:spree::homecontroller_index has a high p99 latency on env:ruby-shop`.

3. Under **Set your targets**, click **New Target +**. Set **Target:** to `99%` and **Time Window:** to `30 Days`.

4. Under **Add names and tags**, enter the following:

   Update the **Name** to `Home Page P99 Latency`{{copy}}.
   
   Add the description `99% of time, the p99 latency of viewing the home page should be lower than 5 seconds`{{copy}}.
   
   Enter or select the **Tags** `env:ruby-shop`, `service:store-frontend`, and `resource_name:spree::homecontroller_index`.

5. Click **Save & Exit**.
   
   ![monitor-slo-create](slopractice/assets/monitor-slo-create.png)

6. In the list of SLOs, click the SLO you just created to view the details, status, and history.

   ![new SLO](slopractice/assets/monitor-slo-new.png)

Because the app was just instrumented with Datadog, more metrics need to be collected before the SLO status and history provide insightful information about the SLO. If the app ran for more than 7 days, the history bar would be solid.

Example of older Monitor Based SLO
![old SLO](slopractice/assets/monitor-slo-7-days.png)

You've created the Monitor Based SLO to track latency for vieing the home page. Let's now create the second SLO to track successfully managing items in a cart.