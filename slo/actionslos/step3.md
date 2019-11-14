Let’s interrupt a service in the app to see how the SLO Status and History are affected.

1. Click `break-app`{{execute}} to interrupt the app service.

2. In <a href="https://app.datadoghq.com/slo" target="_datadog">**Monitor** > **Service Level Objectives**</a>  in Datadog, click the SLO you created in the previous step.
3. Wait for about two minutes. Refresh the SLO view, if needed.

You should now see that the remaining error budget has decreased and may even be less than 0% and in the ALERT status.

![SLO ALERT](actionslos/assets/slo-alert.png)