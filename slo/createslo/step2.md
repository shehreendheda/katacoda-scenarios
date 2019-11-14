Before creating SLIs for SLOs, you can explore and search the metrics available for the app in Metrics, Notebooks, Monitors, Dashboards, and APM in Datadog. 

Let’s look at the metrics that can be used to create SLIs for viewing the homepage.

1. In <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a> in Datadog, click the **storefrontend** service.
2. Scroll down to the list of **Endpoints** and click **Spree::HomeController#index**.
3. Scroll through and explore the data for **Spree::HomeController#index**.
4. Expand the graphs to see which metrics are visualized in each graph. <p> Note the metrics listed for the **Latency** graph. The **trace.rack.request.duration.by.resource_service.99p** metric represents the p99 latency for viewing the home page. *Is this metric relevant to the SLI?*

You can continue to explore and search the different services and metrics for the app. 

In the next step, you will create a monitor for the SLI for latency of viewing the app home page.