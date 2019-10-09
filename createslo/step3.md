# Creating an APM Monitor

To create the monitor for the SLI, 

1. In Datadog, click **Monitor** > **New Monitor** in the main menu bar.
2. Select the **APM** monitor.
3. Expand **Select monitor scope**. Select **APM Metrics** and set **Service:** to **store-frontend**, and **Resource:** to **Spree::HomeController#index**.
4. Expand **Set alert conditions**. Select **Threshold Alert** and set the alert criteria to **Alert when the *p99 latency* is *above* *6* over the last *5 minutes***. Then save the monitor.  
5. Leave **Say what’s happening** and **Notify your team** as is. 
6. Click **Save**. 
7. In the **Manage Monitors** list, click the monitor that you just created to view its details.

[Add grademe for monitor]

The monitor you created will be the SLI that for the SLO. To create the SLO, click **Continue**.