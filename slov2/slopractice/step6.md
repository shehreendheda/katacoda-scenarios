The <a href="https://docs.datadoghq.com/dashboards/widgets/slo/" target="_blank">SLO Summary widget</a> allows you to track your SLOs alongside other data in <a href="https://docs.datadoghq.com/dashboards/" target="_blank">Dashboards. 

1. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards**</a> and click **New Dashboard**.

2. Enter the Dashboard name `Storedog App SLOs` and select **New Screenboard**.

   <a href="https://docs.datadoghq.com/dashboards/screenboards/" target="_blank">Screenboards</a> are used as status boards or storytelling views that update in real-time or represent fixed points in the past. 

3. Click **Edit Widget** next to the screenboard title if the widget options are not displayed.

3. Click and drag the **SLO Summary** widget to the board. The SLO Summary Editor window will pop up.

4. Under **Search and select SLO**, select the Monitor-based SLO you created `Home Page P99 Latency`.

5. Under **Set Time Windows**, notice that `7 Days` is automatically selected for the **Rolling Time Windows** because the SLO time window is for the past 7 days. 

   Select `Week to date` and `Previous week` below **Calendar Time Windows**.

5. Under **Set display preferences**, make sure **Show error budget** is selected.

6. Next to **Widget title**, select **Show a title**. You can leave the title settings as is or modify as desired.

7. Click **Done**.

   ![slo-widget-monitorbased](slopractice/assets/slo-widget-monitorbased-2.png)

8. Repeat steps 3 to 7 for the Metric-based SLO you created.

   Under **Set Time Windows**, notice that `30 Days` is automatically selected for the **Rolling Time Windows** because the SLO time window is for the past 30 days. 

   Select `Month to date` and `Previous month` below **Calendar Time Windows**.

   ![slo-widget-metricbased](slopractice/assets/slo-widget-metricbased-2.png)

   Let's also add two separate Monitor Summary widgets: one for monitors used in Monitor-based SLOs and one for Error Budget Monitors.

9. In the Widget Bar, click the right arrow to see more options.

10. Click and drag the **Monitor Summary** widget to the board. The Monitor Summary Edtior window will pop up.

11. Under **Select summary type**, select **Monitor**.

12. Under **Search for monitors to summarize**, enter `tag:env:ruby-shop type:metric` to list all monitors created for the Storedog app.

13. Leave the **Set display preferences** as is.

14. Under **Widget title**, select **Show a title** and enter the title `Monitors for Monitor-based SLOs`. Leave the title setting as is or modify as desired.

15. Click **Done**.

    ![monitor-widget-monitorsforslos](slopractice/assets/monitor-widget-monitorsforslos.png)

16. Repeat steps 10 to 15 for the Error Budget Monitor you created. 

    To search for the monitor, enter `tag:env:ruby-shop type:slo`.

    Enter the title `Error Budget Monitors for SLOs`.

    ![monitor-widget-errorbudgets](slopractice/assets/monitor-widget-errorbudgets.png)

17. Rearrange and resize the widgets on the boards as desired.

18. Click `Save Changes` next to the dashboard title.

Now that you've created the dashboard for the SLOs and their related monitors, let's see what happens to the SLOs and their error budgets when the app has errors. 
