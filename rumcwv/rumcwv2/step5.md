You saw from the browser audit that some of the Storedog app's CWV scores from syntethic browser testing were undesirable.

Let's use Datadog RUM to see how the app is performing and investigate any bad performance.
    
1. Navigate to the <a href="https://app.datadoghq.com/rum/list" target="_datadog">**UX Monitoring > Rum Applications**</a>.

2. In the **Storedog** application panel, you will see visualizations for User Sessons, Loading Time, and % of views with errors. Click **Application Overview** for this application.

    Scroll through and view the visualizations. On the left, the top panel displays the Core Web Vitals P75. 

    Above the dashboard area, toggle the **Device Type** to view the data for each option: Mobile, Tablet, and Desktop. Notice how the data differs based on device type. Which device has the most **Page View by Version**?

3. In the top menu, click **Dashboards** and select **Performance**.

    Scroll through and view the visualizations in the dashboard.

    In the **Overview** panel, notice the **P75 loading time**. (The axis for the p75 loading time is on the left.)

    In the **Core Web Vitals** panel, notice that the average LCP score is > 2.5 seconds, which is undesireable for a good user experience.

4. In the **Largest Contentful Paint** graph, click a data point > 4 seconds.

    In the menu that appears, select **View RUM events**. A new tab for the **Sessions Explorer** will open with the **Views** tab selected.

5. Select the **View** with the **Browser Name** `Chrome Mobile` from the list. The RUM Events side panel will open.

    Above the flame graph, notice that the Largest Contentful Paint has a red triangle with an exclamation mark, indicating that the value is too high.

    Scroll through the flame graph to view the details. 

    Above the flame graph, select the **Traces** tab to view the APM flame graphs of traces associated with this view.

    Select each trace in the menu to view the associated APM flame graph. Notice that traces for **/ads** and the **/discount** have long spans for the respective request to each service.

    This is one place to start troubleshooting the high LCP value.

    [GIF]
    

Before you start troubleshooting, let's create a RUM Monitor to get notifications when app performance, specically the LCP scores are below expections. 