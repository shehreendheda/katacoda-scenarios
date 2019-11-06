Assume that you share your findings with the relevant team--the team that decided the SLO. The team decides and gets approval to temporarily shut down all services and then bring them all back online to restore the advertisements service.

1. In the **Terminal** tab on the right, enter `ctrl+C` (PC) or `control+C`(Mac).
2. Wait for the services to shut down and the terminal prompt to appear `$`.
3. Click `docker-compose up`{{execute T1}} to bring the services back online.
4. Wait for `docker-compose up` to complete. 
5. Navigate to <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index**</a>  in Datadog. 
6. Wait for about 2 minutes. You may need to refresh the page.
7. Notice that there is no new error data being added to the **Total Requests** and **Total Errors** graphs.
8. Navigate to <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives**</a> and select the SLO you created in Step 2.

With time, the error budget will start to recover. You may have to wait a few minutes to see the change. 

&nbsp;

### Assessment
Click `grademe`{{execute T3}} to receive a grade for this activity. (This command runs in Terminal 3.)