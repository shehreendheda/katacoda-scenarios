Let's check the status of the monitors you created.

1. Navigate to <a href="https://app.datadoghq.com/apm/map" target="_datadog">**APM** > **Service Map**</a>. <p> The outline of the storefrontend, discountsservice, and advertisementsservice nodes are red. This means that the monitor that you created for each service is in the `ALERT` status.

2. Click the **storefrontend** node, then click **Inspect**. <p> Because the discounts service and advertisements service are downstream, let's start investigating those services.  

3. Click the **discountsservice** node, then click **View service overview**. A new tab will open for the discountsservice page.

4. Expand the Latency graph by clicking the arrow icon in the top right of the graph. <p> The service latency seems to hover at 2.5 seconds. *That's a noticable lag in performance!* <p> Close the graph window.

5. Scroll down to the Endpoints list and click the **Get /discount** endpoint. 

6. View the Latency graph, the Span Summary, and the Traces list for the endpoint. Sort the Span Summary using the **AVG DURACTION** in descending order. <p> Notice that the 2.5 second duration is consistent. 

7. Go back to the Service Map browser tab where you were inspecting the storefrontend.

8. Repeat steps 3 to 6 for the **advertisementsservice**. <p> For step 5, click the **Get /ads** endpoint. The AVG LATENCY for this endpoint is also about 2.5 seconds. <p> *The **Get /ads** endpoint has the same latency as the **Get /discount** endpoint!* <p> Let's check the files where these endpoints are defined to see what may be causing the issue. 

9. Click `discounts-service/discounts.py`{{open}}.

10. Browse the file. Notice that two sleep commands (**Lines 27-28** and **Lines 41-42**) were left after testing. Delete these lines.

11. Click `ads-service/ads.py`{{open}}.

12. Browse the file. Notice that two sleep commands (**Lines 41-42** and **Lines 55-56**) were left after testing. Delete these lines.

13. Go back to the Service Map browser tab where you were inspecting the storefrontend.

14. Click the **storefrontend** node, then click **View service overview**. 

15. Scroll to the **Endpoints** list and sort the list by **AVG LATENCY**. <p> Notice the `Spree::HomeController#index`, `Spree::ProductsController#show`, and `Spree::ProductsController#index` have latencies more than 2.5 seconds.

16. For each endpoint listed in step 15, click the endpoint to view its page. <p> Scroll to the **Span Summary** and sort by **AVG DURATION**. <p> Scroll to the **Traces** list. Click any of the traces to view the details. <p> Notice from the **Span Summary** and **Traces** that the endpoint is dependent on the discounts and advertisements services.<p> Deleting the lines in step 10 and 12 that cause the 2.5 second latencies in the discounts and advertisements endpoints should also remove these latencies in the storefront endpoints. <p> (Note: To save time, you only created a monitor for the `Spree::HomeController#index`. You can also create monitors for the other two endpoints to see how they are affected by changes we make to the app.)