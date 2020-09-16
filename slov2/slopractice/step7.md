You can explore the respective APM Resource pages to investigate the depleting error budgets for the SLOs. 

1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM > Services**</a>.

2. Select the `store-frontend` service from the list. 

   Notice that the two monitors you created `...` and `...` are linked to the service and in the ALERT state.

3. Scroll down to the **Endpoints** list and select **Spree::HomeController#index** to explore the data for the resource.

   Notice that the monitor you created for the Monitor Based SLO is linked to the resource and is in the ALERT state.

4. View the **Latency** graph. Notice the increase in latency when the app restarted. Select the `p99` legend option. This is metric you used to create the monitor for the Monitor Based SLO.

5. Scroll down to the **Traces** list. Browse the **Duration** column. 

   Select a trace with duration less than 3 seconds. Note the lengths of the spans for `GET_\ads` and `GET_\discounts`.

   Select a trace  with duration greater than 3 seconds. Notice the lengths of the spans for `GET_\ads` and `GET_\discounts` is longer than those in the traces with duration less than 3 seconds.

   *Looks like ads and discounts services are the sources of the higher latencies!* 
   
   *Investigating/troubleshooting these services can be a first step in restoring the error budget for the Monitor Based SLO.*
  
6. Navigate to `store-frontend` Service page, scroll down to the **Endpoints** list, and select **Spree::OrdersController#edit** to explore the data for the resource.

   Notice that the Error Budget monitor you created for the Metric Based SLO is linked to the resource and is in the ALERT state.

7. Scroll down to the **Traces** list. 

   Filter the list for traces with an **ERROR**. 
   
   Click a trace to see its details, specifically the **Errors** tab for details about the errors.

   *Looks like there error is an in a build file for the store-frontend service!* 
   
   *Investigating/troubleshooting this error can be a first step in restoring the error budget for the Monitor Based SLO.*