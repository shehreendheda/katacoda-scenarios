In <a href="https://docs.datadoghq.com/dashboards/" target="_blank">Dashboards</a>, you can graph <a href="https://docs.datadoghq.com/dashboards/screenboards/" target="_blank">Log Events</a> in <href="https://docs.datadoghq.com/dashboards/widgets/timeseries/" target="_blank">Timeseries</a> widgets to display the evolution of these events over time.

You can also add the <a href="https://docs.datadoghq.com/logs/logs_to_metrics/" target="_blank">Log Stream Widget</a> to <a href="https://docs.datadoghq.com/dashboards/screenboards/" target="_blank">Screenboards</a> to display a live view of a subset of logs (filtered using the log search syntax) alongside related data in the screenboard.

Let's create a screenboard with these widgets. You'll add a Timeseries widget for the counts of error logs in the advertisements and discounts services and a Log Stream widget to displays the stream of corresponding logs.   


1. In a new browser window/tab, use the login credentials provided in the terminal to log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you for this activity.

    Note: If the credentials are not displayed in the terminal, run the command `creds`{{execute}} in the terminal.

2. Navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards** > **New Dashboard**</a> to open the Create dashboard pop-up window.

    Enter `Storedog Logs`{{copy}} for the **Dashboard name** and select **New Screenboard**. You'll be redirected to the new screenboard.

3. Next to the screenboard title, click **Edit Widgets** to display the widget options.

4. Click, drag, and drop the **Timeseries** widget onto the board below. The Timeseries editor will open.

    Under **Graph your data**, change `Metric` to `Log Events` to update the data type to use for the graph.

    Enter `service:advertisements-service`{{copy}}, `service:discounts-service`{{copy}}, `status:error`{{copy}} as the search query.

    Below the search query, update **group by** to `Service` and update **Display** to `Bars`.

    Exapnd **Legend** and select **Compact**.

    Under **Give your graph a title**, enter `count of advertisements and discounts error logs`{{copy}} as the title.

    Click **Save**. The new Timeseries widget will appear on the board. (You can move and resize the widget as needed.)

    ![timeseries](monitorlogs/assets/timeseries_update.gif)

5. In the widget options, click the right arrow until you see the **Log Stream** widget. 

    Click, drag, and drop the **Log Stream** widget to the board below. The Log Stream editor will open.

    Enter `service:advertisements-service`{{copy}}, `service:discounts-service`{{copy}}, `status:error`{{copy}} as the search query.

    Under Widget title, enter `advertisements and discounts error logs`{{copy}}.

    Click **Done**. The new Logs Stream widget will appear on the board. (You can move and resize the widget as needed.)

    ![logstream](monitorlogs/assets/logstream.gif)

6. Click **Save Changes** above the widget options to save the widgets on the dashboard.
