Not all logs collected in Datadog have equal value. Log <a href="https://docs.datadoghq.com/logs/indexes" target="_blank">Indexes</a> allow you to filter your logs into value groups with different retention periods, quotas, usage monitoring, and billing so that you can focus cost and attention on logs that have more value to your workflows. 

When you create an Index, you can set an <a href="https://docs.datadoghq.com/logs/indexes/#indexes-filters" target="_blank">index filter</a>, <a href="https://docs.datadoghq.com/logs/indexes#update-log-retention" target="_blank">retention period</a>, and <a href="https://docs.datadoghq.com/logs/indexes#set-daily-quota" target="_blank">daily quota</a>. All logs that match the index filter will flow through the index. When you have multiple indexes, logs flow through the first index in the Indexes list with matching filtering criteria. 

To investigate and analyze logs filtered through a specific index, you can select the index under Live Indexes in the Index facet in Log Explorer. You can use indexed logs for faceted searching, patterns, analytics, dashboarding, and monitoring.

At a more granular level, not all logs flowing through an index may have the same value. You can include <a href="https://docs.datadoghq.com/logs/indexes/#exclusion-filters" target="_blank">exclusion filters</a> in an index so that any logs matching these filters are discarded from the index. Keep in mind, excluded logs still flow through the <a href="https://docs.datadoghq.com/logs/live_tail/" target="_blank">Live Tail</a>, so they can still be used to <a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">generate metrics</a> or can be <a href="https://docs.datadoghq.com/logs/archives/" target="_blank">archived</a> (more details on the next page). 

By default, all Datadog organizations have a single index `main` representing a monolithic set of all your logs. You can contact <a href="https://docs.datadoghq.com/help/" target="_blank">Support</a> to have multiple indexes enabled.

Let's create an index for the store-frontend logs that excludes some of logs with the INFO status. In this case, it's assumed that INFO logs are not as important as say `ERROR` or `OK` logs and indexing only some of the `INFO` logs still provides enough information about the big picture.

1. In the terminal on the right, you should see a message `Provisioning Complete` along with some login credentials. If you don't see the message and credentials, wait until they appear before continuing.

    In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/logs/pipelines" target="_datadog">**Logs > Configuration > Pipelines**</a>.

    Make sure that the **Datadog Agent**, **python**, and **ruby clone for store-frontend** pipelines are enabled.

3. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/indexes" target="_datadog">**Logs > Configuration > Indexes**</a>.

4. Click **New Index** above the index list to open the New Index editor. 

    Under **Define Index**, enter `env:ruby-shop`{{copy}}, `service:store-frontend`{{copy}} in the **Filter**. Notice the preview list above this field is filtered to the selection.

    Under **Set retention period**, click the menu to view the options. The only available option is 15 days because this is trial account, so let's leave as it.

    Under **Name**, enter `storedog-frontend`{{copy}}.

    Click **Save**. You'll see the new index in the Indexes list.

    ![create-index](managelogs/assets/create-index.gif)

5. Because the order of the Indexes matter, let's move the new `storedog-frontend` index to above the main index so that all the `env:ruby-shop,service:store-frontend` logs get filtered to this index.

    On the right of the `storedog-frontend` index, click the six dots icon and drag then drop the index above the `main` index. 

    ![reorder-index](managelogs/assets/reorder-index.gif)

6. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> and wait for some new logs to come in.

    In the list of facets on the left, you'll now see an **Index** facet under **CORE**. 
    
    Expand the facet. You'll see `main` and `storedog-frontend` in the list. 
    
    Click `storedog-frontend` to filter the Log List to these logs. You'll see the list only display logs for the store-frontend.

    ![select-index](managelogs/assets/select-index.png)

7. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/indexes" target="_datadog">**Logs > Configuration >Indexes**</a> to add an exclusion filter to the index.

    Expand the `storedog-frontend` index and click **Add an Exclusion Filter** to open the Exclusion Filter editor.

    Under **Name**, enter `exclude 50% ok logs`{{copy}}.
    
    Under **Define exclusion query**,  enter `status:ok`{{copy}}. Notice the preview list above this field is filtered to the selection.

    Under **Set exclusion percentage**, enter `50` so that it reads `Exludes 50% of all logs`.

    Click **Save**.

    ![exclusion-filter](managelogs/assets/exclusion-filter.png)

8. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs > Search**</a> and wait for some new logs to come in.

    In the list of facets on the left, click **Info** under **Status** to filter the Log List to just the `INFO` logs in this index.

    Notice that the number of logs displayed in the graph above the list has decreased. This is because only 50% of the INFO logs are now being indexed.

    ![oklogs-excluded](managelogs/assets/oklogs-excluded.png)