Let's restart the fixed app and check the app performance.

1. Click `docker-compose -f docker-compose-broken-instrumented.yml up -d`{{execute}} to restart the app with the updated changes. Note the time that you run this command.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> and wait for new traces to start coming in.

3. Navigate to <a href="https://app.datadoghq.com/apm/app-analytics/analytics" target="_datadog">**APM** > **App Analytics**</a>. Make sure that the Graph icon is selected on the left of the search field.

4. In the graph metrics editor below the search field, select `Resource` for **group by**.

5. In the **Facets** on the left, select `Error` under **Status**. `ERROR` appears in the search field as a filter. <p> Notice that the resources/endpoints that had the `ActionView::Template::Error: undefined method [] for nil:NilClass` error are the only resources in the graph. <p> Also, notice that there are no more errors since you restarted the app.

6. Delete `ERROR` from the search field. 

7. In the graph metrics editor, change `*` to `Duration`. (**Count** will automatically change to **Measure**.) <p> Notice the drop in durations for certain resources after you restarted the app. <p> Hover over each name in the legend below the graph to see which resources had improved performance after fixing the discounts and advertisements services.

8. Navigate to <a href="https://app.datadoghq.com/apm/map" target="_datadog">**APM** > **Service Map**</a>. <p> The outline of the store-frontend, discounts-service, and advertisements-service nodes are now green, meaning the monitor for each service is in the `OK` status.
