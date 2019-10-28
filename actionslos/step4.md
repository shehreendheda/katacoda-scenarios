Assume that a few days have passed and the SLO is still in the ALERT status, indicating that some action is needed to remedy the situation. 

Let’s explore the data in Datadog for the Spree::HomeController#index resource to try and find the source of the problem.
1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services** in Datadog</a>, click the **store-frontend** service.
2. Scroll down to the list of **Endpoints** and click **Spree::HomeController#index**.
3. Wait for about 2 minutes for the data to come in. You may need to refresh the page. 
4. Notice that the graph for **Total Requests** and **Total Errors** are now only receiveing error data, indicated by red bars. 
3. Expand the graphs for **Total Requests** and **Total Errors**. 
4. In the expanded **Total Errors** graph, hover over the red bar. You will see the *http.status_code:500* message for the errors.

![Total Errors](actionslos/assets/totalerrors.png)

5. Close the expanded graph and scroll down to the **Trace** list.
6. Click any trace with a **500 status**.
7. Notice that the spans **rack.request Spree::HomeController#index** and **rails.action_controller Spree::HomeController#index** have errors.
8. Click on the **rack.request Spree::HomeController#index** span, and then click on the **Errors** tab below the graph.
9. Notice that one of the errors indicates **SocketError: Failed to open TCP connection to advertisements:5002**, highlighted in red.
10. To the right of the flame graph, notice that the *advertisementsservice* is not listed.

Looks like the advertisement service is down!


![Total Errors](actionslos/assets/flamegrapherror.png)


Assume that you share your findings with the relevant team--the team that decided the SLO. The team decides and gets approval to temporarily shut down all services and then bring them all back online to restore the advertisement service.

1. In the **Terminal** tab on the right, enter ctrl+C for PC or control+C for Mac.
2. Wait for the services to shut down and the terminal prompt to appear `$`.
3. Click `docker-compose up`{execute T1} to bring the services back online.
4. Wait for `docker-compose up` to complete. 
5. In Datadog, navigate to the **APM > Services > store-frontend > Spree::HomeController#index** page. 
6. Wait for about 2 minutes. You may need to refresh the page.
7. Notice that there are no new error data is being added to the **Total Requests** and **Total Errors** graphs.
8. Navigate to **Monitor** > **Service Level Objectives** and select the SLO you created in Step 2.

With time, the error budget will start to recover. You may have to wait a few minutes to see the change. 
