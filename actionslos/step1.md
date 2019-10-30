To get started, 

1. Click `instrument`{{execute T1}} to instrument the Datadog agent and storedog app for monitoring with Datadog using a docker-compose.yml. 
2. Wait for the docker-compose.yml to finish running. This may take about 3 minutes. 
3. Click the **storedog** tab to the right. You should be able to view the app once docker-compose has finished.

To simulate live user activity in the app so that you can capture all the relevant metrics in Datadog. 

4. Click `traffic`{{execute T2}} to create traffic to the app in an infite loop using GoReplay. (This command runs in Terminal 2.)
5. Navigate to <a href="https://app.datadoghq.com/apm/resource/storefrontend/rack.request/69d105fa043dba7f" target="_datadog">**APM** > **Services** > **storefrontend** > **Spree::HomeController#index** in Datadog</a>. You should see that you are receiving live data in the **Total Requests** graph.

When ready to create the SLO, click **Continue**.