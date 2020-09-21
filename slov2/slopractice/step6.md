The <a href="https://docs.datadoghq.com/dashboards/widgets/slo/" target="_blank">SLO Summary widget</a> allows you to track your SLOs alongside other data in <a href="https://docs.datadoghq.com/dashboards/" target="_blank">Dashboards. 

1. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards**</a> and click **New Dashboard**.

2. Enter the Dashboard name `Storedog App SLOs` and select **New Screenboard**.

   <a href="https://docs.datadoghq.com/dashboards/screenboards/" target="_blank">Screenboards</a> are used as status boards or storytelling views that update in real-time or represent fixed points in the past. 

3. Click and drag the **SLO Summary** widget to the board. The SLO Summary Edtior window will pop up.

4. Under **Search and Select**, select one of the SLOs you created and pick the all time windows that are available.

5. Under **Set display preferences**, make sure **Show error budget** is selected.

6. Next to **Widget title**, select **Show a title**. You can leave the title setting as is or modify them as desired.

7. Click **Done**.

   ![slo-summary-widget](slopractice/assets/slo-summary-widget.gif)

8. Repeat steps 3 to 7 for the other SLO you created.

9. In the Widget Bar, click the right arrow to see more options.

10. Click and drag the **Monitor Summary** widget to the board. The Monitor Summary Edtior window will pop up.

11. Under **Select summary type**, select **Monitor**.

12. Under **Search for monitors to summarize**, enter `tag:env:ruby-shop` to list all monitors created for the Storedog app.

13. Leave the **Set display preferences** as is.

14. Under **Widget title**, select **Show a title**. You can leave the title setting as is or modify them as desired.

15. Click **Done**.

    ![monitor-summary-widget](slopractice/assets/monitor-summary-widget2.gif)

17. Rearrange the widgets on the boards as desired. 

With the Dashbaord created with the SLOs and related monitors, let's see what happens to the SLOs and their error budgets when the app has errors. 
