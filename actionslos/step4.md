Assume that a few days have passed and the SLO is still in the ALERT status, indicating that some action is needed to remedy the situation. 

Let’s explore the data in Datadog for the Spree::HomeController#index resource to try and find the source of the problem.
1. Navigate to <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index** in Datadog</a>.
3. Wait for about 2 minutes for the data to come in. You may need to refresh the page. 
4. Notice that the graph for **Total Requests** and **Total Errors** are now only receiveing error data, indicated by red bars. 
3. Expand the graphs for **Total Requests** and **Total Errors**. 
4. In the expanded **Total Errors** graph, hover over the red bar. You will see the *http.status_code:500* message for the errors.

![Total Errors](actionslos/assets/totalerrors.png)

5. Close the expanded graph and scroll down to the **Trace** list.
6. Click any trace with a **500** status.
7. Notice that the spans **rack.request Spree::HomeController#index** and **rails.action_controller Spree::HomeController#index** have errors.
8. Click the **rack.request Spree::HomeController#index** span, and then click the **Errors** tab below the flame graph.
9. Notice that one of the errors indicates **SocketError: Failed to open TCP connection to advertisements:5002**, highlighted in red.
10. To the right of the flame graph, notice that the **advertisementsservice** is not listed.

Looks like the advertisement service is down!


![Total Errors](actionslos/assets/flamegrapherror.png)