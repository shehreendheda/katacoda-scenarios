With the help of tags, you can create <a href="https://docs.datadoghq.com/monitors/notifications/?tab=is_alertis_warning" target="_blank">targeted alerts</a> so specific teams or team members can be notified if a part of their workflow needs attention.

1. In Datadog, navigate to the <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors** > **New Monitor**</a>.

2. Select **Metric** from the list of monitors.

3. In **Choose the detection method**, select **Threshold Alert**.

4. Expand **Define the metric**. For **Metric**, select  `trace.flask.request.duration`. For **from**, select `env:ruby-shop` to filter by the app environment.

5. Below the metric, change `Single Alert` to `Multi Alert` and select `service` for **(select group)**. 

    You will see that `service` automatically populates the **avg by** (group by) field for the metric. 

    ![alert-metric](apptagging/assets/alert-metric.png) 

6. Expand **Set the alert condition**. For **Alert Threshold**, enter 5. Leave all other fields as is. 

    ![alert-condition](apptagging/assets/alert-condition.png)

7. Expand **Say what's happening**.

    In the **Example Monitor Name** field, enter `The {{service.name}} is running slowly!!`{{copy}}.
    
    In **Example Monitor Message**, enter `The {{service.name}} is running slowly!! Contact: Email - @{{service.name}}@mycompany.com, @<YOUR EMAIL ADDRESS> Slack - @slack-{{service.name}}`{{copy}} 
    
    Assume at Storedog, the email addresses and slack channels for the advertisements and discounts engineering teams are named for their respective services. If either of the services triggers an alert, `{{service.name}}` will be populated with the appropriate service name and that team will be notified. 
    
    Replace `<YOUR EMAIL ADDRESS>` in the message with an email address you would like to receive the test alert at in a later step. Make sure to leave `@` in front of your email address.
    
    For **Tags**, enter `env:ruby-shop`{{copy}}, `service:discounts-service`{{copy}}, `service:advertisements-service`{{copy}}, `team:discounts`{{copy}}, `team:advertisements`{{copy}}. 
    
    ![alert-message](apptagging/assets/alert-message.png)

8. Expand **Notify your team**. The field is already populated with the `@` selections in **Say what's happening**. 

    ![alert-notifications](apptagging/assets/alert-notifications.png) 
    
    Before you save the monitor, let's see an example alert.

9. In the bottom right, click **Test Notifications**. 

10. In the pop-up window that appears, select the **Alert** tile and click **Run Test**. 

    A message appears in the window: `Test notifications sent with group $service:<service.name>`. 
    
    ![alert-tested](apptagging/assets/alert-tested.png)

11. Check your email at the address included in **Notify your team**. You should see an email with the subject `[Monitor Alert] Triggered: [TEST] The <service.name> is running slowly!!`.

12. Open the email to view its details. You will see that the `{{service.name}}` has been replaced with the actual service name throughout the email. 

    ![alert-testemail](apptagging/assets/alert-testemail.png)

13. In Datadog, close the test notifcation window and click **Save** to save the monitor. 

14. Select **Manage Monitors** above the monitor to navigate to the monitors list.

15. On the left of the Monitors list, expand the different Facets. Notice that **Service**, **Tag**, **Env**, and **Team** have optons related to the tags you assigned to the monitor.

14. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a>. Select **discounts-service**.

15. Above the graphs, you will see a **Monitor** banner. Click the banner to view the list of monitors associated with and suggested for the service. Notice that the monitor you created is listed.

Because of the tags you assigned to the monitor in step 7, the monitor is linked to the respective APM service pages.