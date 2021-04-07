You can create <a href="https://docs.datadoghq.com/monitors/monitor_types/log/" target="_blank">Logs Monitors</a> to alert you when a specified type of log exceeds a user-defined threshold over a given period of time.

1. In Datadog, navigate to <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitors** > **New Monitor**</a> to start creating a new monitor.

2. Select **Logs** from the list of monitors to create a monitor using logs events

    ![logsmonitor](monitorlogs/assets/logsmonitor.gif)

3. Under **Define the search query**, enter `service:advertisements-service`{{copy}}, `service:discounts-service`{{copy}}, `status:error`{{copy}}.

    Below the query field, update **group by** to `Service`.

4. Under **Set alert conditions**, update the **Alert threshold** to `5`.

5. Under **Say what's happening**, enter the `High Count of Advertisements/Discounts Error Logs`{{copy}} for the Monitor Name and `The count of {{service.name}} logs is greater than 5.`{{copy}}. 

    For Tags, enter `service:advertisements-service`{{copy}} `service:discounts-service`{{copy}} `env:ruby-shop`{{copy}}

6. Leave **Notify your team** blank, and click **Save**.

7. The monitor will be saved. In the upper right, select the **Status** tab to view the monitor status page. 

8. Wait a few minutes for the monitor status to update. You may need to refresh the page after a few minutes.

9. Browse the details of the monitor. 
    
    Notice under **Events & Watchdog** the different alert events that are listed. 
    
    Also, notice that the `{{service.name}}` in each alert message has been filled out with the specific service name.

