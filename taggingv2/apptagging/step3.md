With the help of tags, you can create <a href="https://docs.datadoghq.com/monitors/notifications/?tab=is_alertis_warning" target="_blank">targeted alerts</a> so specific teams or team members can be notified if a part of their workflow needs attention.

1. In Datadog, navigate to <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors** > **New Monitor**</a> to start creating a new monitor.

2. Select **Metric** from the list of monitors.

3. In **Choose the detection method**, select **Threshold Alert**.

4. Expand **Define the metric**. 

    For **Metric**, select  `trace.flask.request.duration`. 
    
    For **from**, select `env:ruby-shop` to filter by the app environment.

    Below the metric, change `Single Alert` to `Multi Alert` and select `service` for **(select group)**. 

    You will see that `service` automatically populates the **avg by** (group by) field for the metric. 

    ![alert-metric](apptagging/assets/alert-metric.png) 

5. Expand **Set the alert condition**. 

    For **Alert Threshold**, enter 5. 
    
    Leave all other fields as is. 

    ![alert-condition](apptagging/assets/alert-condition.png)

6. Expand **Say what's happening**.

    In the **Example Monitor Name** field, enter `The {{service.name}} is running slowly!!`{{copy}}.
    
    In **Example Monitor Message**, enter `The {{service.name}} is running slowly!! Contact: Email - @{{service.name}}@mycompany.com, @<YOUR EMAIL ADDRESS> Slack - @slack-{{service.name}}`{{copy}} 
    
    Assume at Storedog, the email addresses and slack channels for the advertisements and discounts engineering teams are named for their respective services. If either of the services triggers an alert, `{{service.name}}` will be populated with the appropriate service name and that team will be notified. 
    
    In a later step, you will send a Test Notification with the `{{service.name}}` populated. If you would like to receive the notification, replace `<YOUR EMAIL ADDRESS>` in the monitor message with your email address. Make sure to leave `@` in front of your email address. (If you do not want to enter your email address, that's alright. A screenshot of an example test notification is included below.)
    
    For **Tags**, enter the following tags. Note: After entering each tap, press enter/return.
    
    `env:ruby-shop`{{copy}}
    
    `service:discounts-service`{{copy}}
    
    `service:advertisements-service`{{copy}}
    
    `team:discounts`{{copy}}
    
    `team:advertisements`{{copy}}. 
    
    ![alert-message](apptagging/assets/alert-message.png)

7. Expand **Notify your team**. The field is already populated with the `@` options in **Say what's happening**. (`@<YOUR EMAIL ADDRESS>` will be included if you chose to enter an actual email address.)

    ![alert-notifications](apptagging/assets/alert-notifications.png) 
    
8. Before you save the monitor, let's see an example alert.

    In the bottom right, click **Test Notifications**. 

    In the pop-up window that appears, select the **Alert** tile and click **Run Test**. 

    A message appears in the window: `Test notifications sent with group $service:<service.name>`. 
    
    ![alert-tested](apptagging/assets/alert-tested.png)

    If you entered your email address in step 7, check your email account for an email with the subject `[Monitor Alert] Triggered: [TEST] The <service.name> is running slowly!!`. Open the email to view its details. You will see that the `{{service.name}}` has been replaced with the actual service name throughout the email.

    ![alert-testemail](apptagging/assets/alert-testemail.png)
    
9. In Datadog, close the Test Notification window. 

    Delete your email address from the **Notify your team** field. 
    
    Click **Save** to save the monitor. 

10. Click the command `grademe`{{execute}} to receive credit for creating the monitor.

11. In the upper right of the monitor details, click the wheel icon. Select **Delete** to remove the monitor. 
