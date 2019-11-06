Using the monitor, let's now create the SLO to track that, 99% of time, the p99 latency of viewing the home page should be lower than 6 seconds.

1. In <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives**</a>  in Datadog, click **New SLO**. 
2. Under **Define the source**, select **Monitor Based**, then select the monitor you created in the previous step from the menu.
3. Under **Set your targets**, click **Set Target +** and set **Target:** to **99%** and **Time Window:** to **7 Days**.
4. Under **Add names and tags**, enter **Home Page Latency** for **Name:** and **99% of time, the p99 latency of viewing the home page should be lower than 6 seconds** for **Description**.
5. Click **Save**.
6. In the **Service Level Objectives** list, click the SLO you just created to view the details, status, and history.

Because the app was just instrumented with Datadog, more metrics need to be collected before the SLO status and history provide insightful information about the SLO. If the app ran for 7 days or more, the history bar would be solid.

&nbsp;

Example of new Monitor Based SLO
![new SLO](createslo/assets/monitor-slo-new.png)

&nbsp;


Example of >7 days Monitor Based SLO
![old SLO](createslo/assets/monitor-slo-7-days.png)

&nbsp;

### Assessment
Click `grademe`{{execute T3}} to receive a grade for this activity. (This command runs in Terminal 3.)