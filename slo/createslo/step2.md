Before creating SLIs for SLOs, you can explore and search the metrics available for the app in Metrics, Notebooks, Monitors, Dashboards, and APM in Datadog. 

Let’s look at some metrics in APM that can be used to create SLIs for viewing the homepage. 

## APM
1. In <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services** in Datadog</a>, click the **storefrontend** service.
2. Scroll down to the list of **Endpoints** and click **Spree::HomeController#index**.
3. Scroll through and explore the data for **Spree::HomeController#index**.
4. Expand the graphs to see which metrics are visualized in each graph.
5. In the **Span Summary** block, search “rack” to list only the **rack.request Spree::HomeController#index** span. Notice the span is in 100% of the traces.
6. Scroll down to the **Trace** list and click any trace. The first span in the trace is the **rack.request Spree::HomeController#index** span.

You can continue to explore and search the different services and metrics for the app. 

In the next step, you will create a monitor for the SLI for latency of viewing the app home page.