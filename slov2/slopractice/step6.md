In the terminal, the Storedog app is being restarted. This may take up to two minutes. Once the app is ready, you will see the following message in the terminal: `The environment is prepared!`. 

The restarted app is broken, so you will now see errors in the app data. 

1. Navigate to <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitors > SLOs**</a>.

   The SLO statuses and remaining error budgets should be less than 100% or even in the `ALERT` state because of the new app errors. 

2. Click the Monitor Based SLO and view its details. Close the SLO. 

3. Click the Metric Based SLO and view its details. 

4. Click the **Alerts** tab for the Metrics Based SLO. Notice that the Alert is in the ALERT state.

The significant change in the SLO statuses is due to the relatively low traffic and the trace metrics only having less than an hour's worth of history. The number of total events (SLI denominator value) is relatively small, making the SLO sensitive to even just one error. In a real world scenario, the number of total events will be in the thousands or millions, so one error wouldn't normally have such a large impact.

When you see your error budget is depleted or close to being depleted, you should take action to restore the error budget.  

...