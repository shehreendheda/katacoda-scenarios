With tags, you can create <a href="https://docs.datadoghq.com/monitors/notifications/?tab=is_alertis_warning" target="_blank">targeted alerts</a> so specific teams or team members can be notified if a resource or service that is relevant to their workflows needs attention.

1. In Datadog, navigate to the <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **New Monitor**</a>.

2. Select **Metric** from the list of monitors.

3. Expand **Choose the detection method**. Select **Threshold Alert**.

4. Expand **Define the metric**. For **Metric**, select  `trace.flask.request.duration`. For **from**, select `env:ruby-shop` to filter by the app environment.

5. Below the metric, select `Mutli Alert` from the menu and enter `service` for **(select group)**. <p> You will see that `service` automatically populates the **avg by** (group by) field for the metric. <p>![alert-metric](apptagging/assets/alert-metric.png) 

6. Expand **Set the alert condition**. For **Alert Threshold**, enter 5. Leave all other fields as is. <p>![alert-condition](apptagging/assets/alert-condition.png)

7. Expand **Say what's happening**. Fill in each field as shown below. <p> At Storedog, the email addresses and slack channels for the advertisements and discounts engineering teams are named for their respective services. <p> When you start typing `{{service.`, select `service.name` from the list that appears. <p>To replace `<YOUR EMAIL ADDRESS>`, type `@` and select your name from the list that appears. <p>Remember to assign the tags below the message. <p>![alert-message](apptagging/assets/alert-message4.png)

8. Expand **Notify your team**. The field is already populated with the `@` selections in **Say what's happening**. <p>![alert-notifications](apptagging/assets/alert-notifications.png) <p> Before you save the monitor, let's see an example alert.

9. In the bottom right, click **Test Notifications**. 

10. In the pop-up window that appears, select the **Alert** tile and click **Run Test**. <p> A message appears in the window: `Test notifications sent with group service:<service name>`. <p>![alert-tested](apptagging/assets/alert-tested.png)

11. Check your email at the address included in **Notify your team**. You should see an email with the subject `[Monitor Alert] Triggered: [TEST] The <service name> is running slowly!`.

12. Open the email to view its details. You will see that the `{{service.name}}` has been replaced with the actual service name throughout the email. <p>![alert-testemail](apptagging/assets/alert-testemail2.png)

13. In Datadog, close the test notifcation window and click **Save** to save the monitor. 

14. Select **Manage Monitors** above the monitor to navigate to the monitors list.

15. To the left of the monitors list, expand the different filter facets. <p> You will see that **Service**, **Tag**, **Env**, and **Team** have optons related to the tags you assigned to the monitor.

14. Navigate to <a href="https://app.datadoghq.com/apm/service/discountsservice" target="_datadog">**APM** > **Services** > **discountsservice**</a>. 

15. Above the graphs, you will see a banner **1 Monitor ##**. Click the banner to view the list of monitors associated with and suggested for the service.

Because of the tags you assigned to the monitor in step 7, the monitor is linked to the respective services in the APM page.