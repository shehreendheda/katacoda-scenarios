While the monitors are gathering data, let's see how the store-frontend service is performing. 

1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a>. <p> If there is a menu next to the **Search APM** field, make sure that `env:ruby-shop` is selected. A menu is available if you've monitored more than one application environment in this Datadog organization.

2. Select the **store-frontend** service and browse its details. <p> Click the monitor banner to see that the monitor you created is linked to the service. <p> Notice that there is error data in the **Total Requests** and **Total Errors** graphs. *Looks like the store-frontend is not working correctly!*

3. Click a red bar in the **Total Errors** graph. Select the **View Traces** option. <p> You will be redirected to the Traces page. The search field is populated with the related facets. 

4. Click any trace to view its details. <p> Notice the spans in the Flame Graph that have error flags.

5. Below the Flame Graph, click the **Errors (#)** tab. <p> Browse the details for the errors titled `ActionView::Template::Error: undefined method [] for nil:NilClass`. <p> The first line in the details indicates `/spree/store-frontend/app/views/spree/layouts/spree_application.html.erb:24`. The error is originating from line 24 of the spree_applications.html.erb file for the store-frontend service. <p> Let's fix the error.

6. In the directory on the right, open the file **store-frontend-broken-instrumented/store-frontend/app/views/spree/layouts/spree_application.html.erb** and locate **Line 24**.

7. Copy and delete (or cut) the text `<br /><center><a href="<%= @ads['url'] %>"><img src="data:image/png;base64,<%= @ads['base64'] %>" /></a></center>` from the line. <p> This line for banner ads should be in two other files for the store-frontend.

8. Open the file **store-frontend-broken-instrumented/store-frontend/app/views/spree/products/show.html.erb**. 

9. Scroll to the bottom of the file (**Line 48**). Paste the line from step 7. 
```<br /><center><a href="<%= @ads['url'] %>"><img src="data:image/png;base64,<%= @ads['base64'] %>" /></a></center>```{{copy}}

10. Open the file **store-frontend-broken-instrumented/store-frontend/app/views/spree/home/index.html.erb**. 

11. Create a new line under **Line 11** and paste the line from step 7. 
```<br /><center><a href="<%= @ads['url'] %>"><img src="data:image/png;base64,<%= @ads['base64'] %>" /></a></center>```{{copy}} Make sure to match the indent of the new line (**Line 12**) to that of the next line (**Line 13**).

These changes should fix the errors you are seeing in the store-frontend service. If you scroll to the trace statistics graphs for the service, you'll notice that the latency is high (> 1s). Let's explore what may be causing this high latency.