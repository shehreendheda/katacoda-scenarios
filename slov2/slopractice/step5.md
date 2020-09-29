<a href="https://docs.datadoghq.com/monitors/service_level_objectives/metric/" target="_blank">Metric-based SLOs</a> take a count-based approach to tracking SLIs. The SLI is the ratio of “good” events divided by total events. The SLO target sets the expectation for the percentage of total events that should be “good”.

Because successfully managing items in the cart depends on successful requests to an app service resource,  you'll create a Metric-based SLO to track succussfully managing items in the cart.

SLO:
*`"Over a 7-day period, 99% of requests to the cart will be successful."`*

## Creating the Metric-based SLO

1. Navigate to <a href="https://app.datadoghq.com/slo/new" target="_datadog">**Monitor** > **New SLO**</a>.

2. Under **Define the source**, select **Metric-based**.

3. Update the fields under **Good events** and **Total Events** as shown below.

   To add the errors metric in **Good events**, click **Advanced** and then **Add Query**. Search the metrics list for `trace.rack.requests.errors`. Select the metric if it is listed, then fill out the **from** field as indicated in the image. If the metric is not listed, click the `</>` icon, then manually enter (copy/paste) `sum:trace.rack.request.errors{service:store-frontend,resource_name:spree::orderscontroller_edit,env:ruby-shop}.as_count()`{{copy}}.

   Update the expression to `a - b`.

   ![metric-slo-addquery](slopractice/assets/metric-slo-addquery.gif) 

3. Under **Set your targets**, click **New Target +**. Set **Target:** to `99%` and **Time Window:** to `7 Days`.

4. Under **Add names and tags**, enter the following:

   Enter `Managing Items in the Cart`{{copy}} for **Name**
   
   Add the descriptions `99% of requests to the cart will be successful`{{copy}}.
   
   Enter the **Tags** `env:ruby-shop`, `service:store-frontend`, and `resource_name:spree::ordercontroller_edit`.

5. Click **Save & Exit**.

   ![metric-slo-create](slopractice/assets/metric-slo-create.png) 

6. In the list of SLOs, click the SLO you just created to view the details, status, and history.

   ![metric-slo-new](slopractice/assets/metric-slo-new.png) 

Let's set an alert to monitor the error budget of the SLO. <a href="https://docs.datadoghq.com/monitors/service_level_objectives/error_budget/" target="_blank">Error budget monitors</a> warn or alert you when the error budget has been consumed by a certain percentage (which you choose).

## Setting up an Error Budget Monitor

1. In the details panel for the SLO, click **Set up Alerts**.

   Note: You could have also clicked **Save and Set Alert** when you were creating the SLO to set up the alert.

2. Update the **Set alerting conditions** as follows:

   Update the Error budget alert to **Trigger if** `95` **% of budget for** `30-day target` **is consumed.** 
   
   Click **New Condition** to add an Error budget warning for the alert. Leave the condition as is.

3. Under **Say what's happening**, enter the following:

   Add the description `Warn on 90% of error budget consumed. Alert on 95% of error budget consumder.`{{copy}}

   Add the **Tags** `env:ruby-shop`, `service:store-frontend`, and `resource_name:spree::ordercontroller_edit`.

4. Make sure the **Notify your team** field is blank and `Do not notify` is selected. No notifications are needed in this activity.

5. Click **Save Alerting Setup**.

   ![errorbudget-monitor-create](slopractice/assets/errorbudget-monitor-create.png)   

   The monitor status with will first read `NO DATA` before it shows the actual monitor status. 

6. Navigate to <a href="https://app.datadoghq.com/event/stream" target="_datadog">**Events**</a>. Browse the stream or search for `SLO` to see the <a href="https://docs.datadoghq.com/monitors/service_level_objectives/#slo-audit-events" target="_blank">audit events</a> for the SLOs and Monitors/Alerts you've created.

Now that you've created the SLOs, let's add the SLOs to a dashboard.