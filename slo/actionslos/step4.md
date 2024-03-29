Assume that a few days have passed and the SLO is still in the ALERT status, indicating that some action is needed to remedy the situation. 

Let’s explore the data in Datadog for the Spree::HomeController#index resource to try and find the source of the problem.
1. Navigate to <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index**</a>  in Datadog.

2. Wait for about two minutes for the data to come in. You may need to refresh the page.

3. Notice that the graph for **Total Requests** and **Total Errors** are now receiving error data only, indicated by red bars.

4. Expand the graphs for **Total Requests** and **Total Errors**.

5. In the expanded **Total Errors** graph, hover over the red bar. You will see the *http.status_code:500* message for the errors. <p> ![Total Errors](actionslos/assets/totalerrors.png)

6. Close the expanded graph and scroll down to the **Trace** list.

7. Click any trace with a **500** status.

8. In the flame graph, notice that the spans **rack.request Spree::HomeController#index** and **rails.action_controller Spree::HomeController#index** have errors.

9. Click the **rack.request Spree::HomeController#index** span, and then click the **Errors** tab below the flame graph.

10. Notice that one of the errors indicates **SocketError: Failed to open TCP connection to advertisements:5002**, highlighted in red.

11. On the right of the flame graph, notice that the **advertisementsservice** is not listed. <p> Looks like the advertisements service is down! <p> ![Total Errors](actionslos/assets/flamegrapherror.png)