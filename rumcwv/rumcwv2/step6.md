You've found that the home page (**/** VIEW PATH GROUP) has the highest PC75 LCP. You can view the details for the RUM events in the Sessions Explorer, including associated APM traces (which were connected during configuration), to try to find and troubleshoot the cause of the poor performance.  

1. In the **Perfomance Overview** dashboard, scroll down to the **Most viewed pages** panel. Click **/** under the **VIEW PATH GROUP**. In the menu that appears, select **View RUM events**. A new tab will open in the Sessions Explorer with the list of **Views** filtered to .

5. Select the **View** with the **Browser Name** `Chrome Mobile` from the list. The RUM Events side panel will open.

    Above the flame graph, notice that the Largest Contentful Paint has a red triangle with an exclamation mark, indicating that the value is too high.

    Scroll through the flame graph to view the details. 

    Above the flame graph, select the **Traces** tab to view the APM flame graphs of traces associated with this view.

    Select each trace in the menu to view the associated APM flame graph. Notice that traces for **/ads** and the **/discount** have long spans for the respective request to each service.

    This is one place to start troubleshooting the high LCP value.

    [GIF]

4. Then hover over the warning sign next to the LCP score, and you’ll see how the current score measures up to what’s needed for a good one. In this view, you’ll additionally be able to review measurements of every Core Web Vital across the timeline.

5. Now let’s [review what the culprit is](link to a block of bad code in ‘instrumented-fixed’) in the code. As you can see (explanation of bad code goes here).

6. In order to fix this replace the block on lines x through y with (block of good code). This will (explanation of what fixed code will do).

7. Now that we’ve put in our fix, let’s verify that it resolved the underlying issue!

    Let’s [navigate back to Storedog](link to the fixed version of the app), and repeat some of the same UI interactions you performed before.

8. Then we can take a look at the P75 average for Largest Contentful Paint, and see that the average initial loading time has increased dramatically, and is reporting within the desired 0-2.5s range. 

9. Now return to the [views page](link to RUM Sessions/views) in the RUM sessions overview for this app, click on the most recent session, and verify that it shows that the Largest Contentful Paint is within the target range of 0-2500ms as well.

    You’ve now verified that these changes have optimized the UX performance of this app, and the loading experience is currently acceptable for your users in production.

