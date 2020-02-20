Based on how the tags have been assigned, you can search the data using the tags and can jump between correlated metric, log, and trace data.

Let's explore the data for the Storedog app.

1. In a new window/tab, log in to the Datadog account/organization that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Login Now** in the “Congrats” email you received after you joined the account/organization.

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, you can move on to the next step. <p>If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. <p> Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Get Started**, then click **Start Trial** in the pop-up window. Select **Container**, then select the **docker** tile. Scroll to the bottom and click **Explore your Logs**.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are coming in. <p> If you are working in a new Datadog organization, the link will be redirected to the **APM** > **Introduction** page. You may need to wait about two minutes as Datadog's Autodiscovery feature picks up the traces that are coming in. In the main menu, when the option appears, click the **APM > Traces** to see the list of traces.

3. In the search field above the list of traces, enter `Env:ruby-shop` if it is not listed to make sure that you are only viewing traces for the Storedog app.

4. If you see no traces are listed, wait until you see traces listed. You can also refresh the page. 

5. In the search field, type `service:` next to the `env` tag to see which services appear. <p>![servicetag-tracesearch](apptagging/assets/servicetag-tracesearch.png) <p>(Although the `service:postgres` tag was not assigned to traces via the configuration files, the PostgreSQL Integration was automatically installed via Autodiscovery and the tags were assigned via integration inheritance.)

6. Add `service:advertisementsservice` to the search field to view the traces for the advertisements service.

7. Click any trace in the list to view its details. 

8. Below the trace flame graph, click the **Logs (#)** tab to view the list of logs associated with this trace. 

9. Click any of the logs. A new tab will open for the **Log Explorer** and the details for the log you clicked. <p>Notice the tag selected in the search field above the lists of logs is the `trace_id` for the specific trace. The `trace_id` tag is assigned by Datadog. To learn more, view the <a href="https://docs.datadoghq.com/logs/processing/#trace-id-attribute" target="_blank">Log Management Processing</a> documentation. 

10. Clear the search field in the Log Explorer. All the logs will appear in the list.

11. In the Log Explorer search field, add `env:ruby-shop` and `service:discount-service`.

12. Click any log in the list to view its details.

13. Near the top of the log details, click **Service** and then select **Go to APM Service Page**. The service page associated with the trace log will open in a new tab.

With deliberate tagging, you can easily search your data and can smoothly navigate between different pages in Datadog.

Let's now create a targeted alert for the advertisements and discounts services.