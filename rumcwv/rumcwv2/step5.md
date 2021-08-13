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

    ![performance-dashboard](assets/performance-dashboard.png)
    
Let's explore the LCP performance in more detail to understand why the score is so low and determine how to fix the poor performance.