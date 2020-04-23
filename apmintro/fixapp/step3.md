While the monitors are gathering data, let's visit the storefrontend service and see how it is performing. 

1. Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Traces**</a>. <p> If there is a meny next to the **Search APM** field, make sure that `env:ruby-shop` is selected. The menu is available if you've monitored more than one environment in this organization.

2. Select the **storefrontend** service.

3. Browse the details of the service. <p> Notice that the monitor you created is linked to the service. <p> Also, notice that there are request errors in the **Total Requests** and **Total Errors** graphs.

4. Click a red bar in **Total Errors**. Select the **View Traces** option. <p> You will be redirected to the Traces page. The search field is populated with related facets. 

5. Click any trace to view its details. <p> Notice the spans in the Flame Graph that have error flags.

6. Below the Flame Graph, click the **Errors (#)** tab. <p> Browse the details for the errors titled `ActionView::Template::Error: undefined method [] for nil:NilClass`. <p> The first line in the details indicates `/spree/sandbox/app/views/spree/layouts/spree_application.html.erb:14`. The error is originating from line 14 of the spree_applications.html.erb file for the storefrontend service. <p> Let's fix the error.

7. Click `store-frontend/app/views/spree/layouts/spree_application.html.erb`{{open}} and locate **Line 14**.

8. Copy and delete (or cut) the text `<br /><center><a href="<%= @ads['url'] %>"><img src="data:image/png;base64,<%= @ads['base64'] %>" /></a></center>` from the line. <p> This line for banner ads should be in two other files for the storefrontend.

9. Click `store-frontend/app/views/spree/products/show.html.erb`{{open}} to open the first file. 

10. Scroll to the bottom of the file (**Line 48**). Paste the line from step 8.

11. Click `store-frontend/app/views/spree/home/index.html.erb`{{open}} to open the second file. 

12. Create a new line under **Line 11** and paste the line from step 8. Make sure to match the indent of the new line (**Line 12**) to that of the next line (**Line 13**).

Now that the error is fixed, you can restart the app to see if the error is removed. But, before you do, let's make sure that there are no other errors that need to be fixed.