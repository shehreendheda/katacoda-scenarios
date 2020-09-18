In the terminal, the Storedog app is being restarted. This may take up to 2 minutes. Once the app is ready, you will see the following message in the terminal: `The environment is prepared!`. 

The restarted app is broken, so you will now see errors in the app.

1. Close the browser tab you opened earlier for the Storedog app.

2. Click the **storedog** tab to the right. A new browser tab will open for the broken Storedog app. 

2. Notice how long it takes the home page to load. 

   *The home page is taking longer to load for the broken app.*

3. Click a product and add an item to the cart.

   *A NoMethodError page appears. Users are unable to add items to the cart.* 

   Let's check the SLOs that you created for these user actions.

4. Navigate to <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitors > SLOs**</a>.

   The SLO statuses and remaining error budgets should be less than 100% or even in the `ALERT` state because of the new app errors. 

5. Click the Monitor Based SLO and view its details. Close the SLO. 

6. Click the Metric Based SLO and view its details. ...

7. Click the **Alerts** tab for the Metric Based SLO. Notice that the Alert is in the ALERT state.

8. Navigate to <a href="https://app.datadoghq.com/dashboards" target="_datadog">**Dashboards**</a>. Select the dashboard you created for the SLOs. 

9. Click each SLO to view its details. Each SLO will open in a new browser tab.

The significant change in the SLO statuses is due to the relatively low traffic and the trace metrics only having less than an hour's worth of history. The number of total events (SLI denominator value) is relatively small, making the SLO sensitive to even just one error. In a real world scenario, the number of total events will be in the thousands or millions, so one error wouldn't normally have such a large impact.

When you see your error budget is depleted, or better when it is close to depleting, you should take action to restore the error budget. The next page is an optional walkthrough of investigating the app errors using Datadog, followed by an optional exercise to create more SLOs.

#### Assessment

This concludes the required portion of the activity. Click `grademe`{{execute}} to recieve a grade for the activity. 

Click **Continue** to go to the next page. If you want to skip the two optional exercises, click the gray arrow `>` above the instructions for both pages.