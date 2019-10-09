# Creating a Monitor Based SLO

Now that you’ve created a monitor for …, you can create the SLO to track …

1. In Datadog, click **Monitor** > **Service Level Objectives** in the main menu.
2. In the upper right, click **New SLO**. 
3. Under **Define the source**, select **Monitor Based**, then select the monitor you created from the menu.
4. Under **Set your targets**, click **Set Target +** and set **Target:** to **99%** and **Time Window:** to **7 Days**.
5. Under **Add names and tags**, enter … for **Name:** and … for **Tags:**.
6. Click **Save**.
7. In the Service Level Objectives list, click the SLO you just created to view the details, status and history.

[Add grademe for slo]

Because your app was just instrumented with Datadog, more metrics need to be collected before the SLO status and history provide insightful information about the SLO. If the app ran for 7 days or more, the history line bar would be a solid.

New Monitor Based SLO
![new SLO](createslo/assets/monitor-slo-new.png)

Day 7+ Monitor Based SLO
![old SLO](createslo/assets/monitor-slo-7-days.png)
