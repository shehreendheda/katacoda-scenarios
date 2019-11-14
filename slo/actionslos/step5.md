Assume that you share your findings with the relevant team--the team that decided the SLO. The team decides and gets approval to restart all services to restore the advertisements service.

1. Click `cd /app-files; docker-compose up -d`{{execute T1}} to bring the services back online.

2. Wait for `docker-compose up` to complete.

3. Navigate to <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index**</a> in Datadog to view the live data coming in. <p> You may need to wait for about two minutes and refresh the page.

4. Notice that there is no new error data being added to the **Total Requests** and **Total Errors** graphs.

5. Navigate to <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives**</a> and select the SLO you created in Step 2.

With time, the error budget will start to recover. You may have to wait a few minutes to see the change. 

&nbsp;

### Assessment
Click `grademe`{{execute}} to receive a grade for this activity.