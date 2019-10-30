Let’s disrupt a service in the app to see how the SLO Status and History are affected.

1. Click `disrupt`{{execute T3}} to disrupt the app service. (This command runs in **Terminal 3**.)
2. In <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives** in Datadog</a>, click the SLO you created in the previous step.
3. Wait for about 2 minutes. Refresh the SLO view, if needed.

You should now see that the remaining error budget has decreased and may even be less than 0%, which means that SLO is now in the ALERT status.

![SLO ALERT](actionslos/assets/slo-alert.png)