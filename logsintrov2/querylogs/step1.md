The <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Search</a> view in <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Logs</a> is the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a> that displays indexed logs matching a search context (a search query for a selected time range). 

Let's start working with the Logs Search.

1. In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>.

3. You can use the search field and the Facets list to create a search query to filter the Log List. 

    A search query can include assigned tags like `env` and `service`, attributes extracted from the logs like `@http.status_code`, and text strings from log messages. Search queries built in the search field require proper <a href="https://docs.datadoghq.com/logs/search_syntax/" target="_blank">search syntax</a>.

    In the Facets on the left of the Log List, select `advertisements-service` and `discounts-service` under **Service** and `Error` under the **Status** to filter logs just those for these services. 

    [screenshot]

4. When you click a log in the Log List, the <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> opens with the log details including assigned tags, the log message, any extracted attributes, related traces, and related infrastructure metrics.

    [gif]

    Click a log in the list and view the details of the side panel. Click the **Traces** tab to view the associated trace. Click the **Metrics** tab to view the associated infrastructure metric.
    
    Notice the log message. Instead of using the ERROR status, let's use the log message to filter log error logs for these services. 
    
    Copy the part of the log message that reads `An error occured`{{copy}}

    In the search field, click the X for `ERROR` to delete it. Now, paste the log message text `An error occured`{{copy}} in the search field. Notice the same list of logs appears. 

    Delete the `An error occured` text from the search field.

5. Common tags and attributes appear in the <a href="https://docs.datadoghq.com/logs/explorer/facets/" target="_blank">Facets</a> list on the left of the Log List automatically. But, to add or edit a tag or attribute to the Facets panel, click the corresponding tag or attribute in a log detail and select Create/Edit Facet.

    [screenshot/gif]

    Click one of the logs to open the log side panel. Scroll down to view the list of **Event Attributes**.

    Next to `name` under `process`, click the wheel icon that appears. Select **Create facet for @process.name**. 
    
    The **Add facet** window will appear. You can expand **Advanced** to view the additional fields. Click **Add**. 
    
    You'll see a message confirming that the facet has been successfully added. Close the logs side panel. 

    Scroll to the bottom of the Facets list. Under the **OTHERS** facet group, expand the **process.name** facet. You'll see the values of this attribute that are found in this filtered set of the logs.

    It’s important to remember, though, that the tags and attributes available to you for creating search contexts depends on the tags you assign to the logs and the attributes you extract from the logs. 

6. To save a search query, click **Save As** above the search field. 

    The **Views** panel will open with a list of <a href="https://docs.datadoghq.com/logs/explorer/saved_views/" target="_blank">Saved Views</a>. (This will only have the Default View listed if you have not yet saved a Logs view.) 
    
    Enter `Ads+Discounts`{{copy}} as the name of the **New View** and click **Save**. The new saved view will appear in the list.  

    [gif] 

    Click the **Default view** option. You'll see the Log List on the right change.

    Click the **Ads+Discounts** option. You'll see the Log List change to the filtered list you have earlier.

    Click **Hide** above the filtered views.

7. In the time range above the Log List, select `Live Tail`. 

    <a href="https://docs.datadoghq.com/logs/explorer/live_tail/" target="_blank">Live Tail</a> is all logs ingested by Datadog after processing, but before indexing (or archiving). These logs do not persist in this list, so you can’t see past logs that have been displayed. A search query in Live Tail displays all live logs that match the query.

    [screenshot]


