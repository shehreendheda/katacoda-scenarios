Now, let's create the monitor for the SLI.

1. In <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **New Monitor**</a> in Datadog, select the **APM** monitor.
2. Expand **Select monitor scope** and select **APM Metrics**. Set **Service:** to **storefrontend**, and **Resource:** to **Spree::HomeController#index**.
3. Expand **Set alert conditions** and select **Threshold Alert**. Set the alert criteria to **Alert when the *p99 latency* is *above* *6* over the last *5 minutes***.  
4. Leave **Say what’s happening** and **Notify your team** as is. 
5. Click **Save**. 
6. In the **Manage Monitors** list, click the monitor that you just created to view its details.

(If you'd like to learn more about APM Monitors in Datadog, click <a href="https://docs.datadoghq.com/monitors/monitor_types/apm/?tab=apmmetrics#overview" target="_blank">here</a>.)

The monitor you created will be used to create the Monitor Based SLO.