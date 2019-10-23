To create the monitor for the SLI, 

1. In <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **New Monitor** in Datadog</a>, select the **APM** monitor.
2. Expand **Select monitor scope**. Select **APM Metrics** and set **Service:** to **store-frontend**, and **Resource:** to **Spree::HomeController#index**.
3. Expand **Set alert conditions**. Select **Threshold Alert** and set the alert criteria to **Alert when the *p99 latency* is *above* *6* over the last *5 minutes***.  
4. Leave **Say what’s happening** and **Notify your team** as is. 
5. Click **Save**. 
6. In the **Manage Monitors** list, click the monitor that you just created to view its details.

[Add grademe for monitor]

The monitor you created will be the SLI for the SLO. To create the SLO, click **Continue**.