# Exploring Metrics for SLIs

Before you create SLIs for SLOs, you can explore and search the metrics available for the app in Metrics, Notebooks, Monitors, Dashboards, and APM in Datadog. 

Let’s look at some metrics in APM and Metrics that can be used to create SLIs for viewing the homepage. 

## APM
1. In Datadog, click **APM** > **Services** in the main menu.
2. Click the **store-frontend** service.
3. Scroll down to list of **Endpoint** and click **Spree::HomeController#index**.
4. Scroll through and explore the data for **Spree::HomeController#index**.
5. Expand the graphs to see which metrics are used for each graph.
Notice that there is no graph for errors. Looks like there are no errors in viewing the home page!
6. In the Span Summary block, search “rack” to list only the **rack.request Spree::HomeController#index** span. Notice the span is in 100% of the traces.
7. Scroll down to the Trace list and click any trace. The first span in the trace is the **rack.request Spree::HomeController#index** span.

You can continue to explore and search the different services and metrics for the app. 

In the next step, you will create a monitor as an SLI for tracking latency of viewing the app homepage. When ready, click **Continue**.