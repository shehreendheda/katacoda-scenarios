In a custom or cloned pipeline, you can edit processors that are in the pipeline. Let's update some of the processors in the **ruby clone for store-frontend** pipeline.

1. Navigate to the Log List in <a href="https://app.datadoghq.com/logs" target="_blank">**Logs > Search**</a> and filter the list to the `service:store-frontend` logs.

2. Click a log detail that has content `Completed ...`.

    Notice that the `method`, `status_code`, and `path` are listed in the `payload` attributes group. 

    In the list of facets on the left, expand **URL Path** and **Status Code** under **Web Access**. Notice that there are no values listed.

    The processors in the pipeline will need to be updated so that the logs are processed with these attributes.

3. In a new tab or browser, navigate to <a href="https://app.datadoghq.com/logs/pipelines/" target="_datadog">**Logs > Configuration > Pipelines**</a> and expand the **ruby clone for store-frontend** pipeline in the Pipelines list.

4. In the list of processors, locate the **Remapper: remap method to http.method**. 

    Hover over the processer and click **Edit** to open the Edit Remapper window. 
    
    Under **Set attribute(s) or tag key to remap**, update `method` to `payload.method`. 
    
    Under the **Name the processor**, update `remap method to http.method` to `remap payload.method to http.method`.

    Click **Save**.

5. In the list of processors, locate the **Remapper: remap path to http.url_details.path**. 

    Hover over the processer and click **Edit** to open the Edit Remapper window. 
    
    Under **Set attribute(s) or tag key to remap**, update `path` to `payload.path`. 
    
    Under the **Name the processor**, update `remap method to http.method` to `remap payload.path to http.url_details.path`.

    Click **Save**.

6. In the list of processors, locate the **Remapper: remap status to http.status_code**. 

    Hover over the processer and click **Edit** to open the Edit Remapper window. 
    
    Under **Set attribute(s) or tag key to remap**, update `status` to `payload.status`. 
    
    Under the **Name the processor**, update `remap status to http.status_code` to `remap payload.status to http.status_code`.

7. In the tab/browser with **Logs Search**, wait for new logs to come in. There may be a pause in the log stream as new logs come in. 

    In the facets on the left, expand **URL path** and **Status** under **Web Access**. Notice that there are are now values listed. 
    
    You could add the `http.method` attribute as a facet from a log detail if you want to list that attribute as well. 
    
    Click a log detail that has content `Completed ...`. Notice that the `http` attribute group now appears with the three attributes listed. Press the up/down arrow keys to view more logs details. 
    
    In one of the logs detaisl, click the wheel icon next to the `http.method` attribute and select **Create facet for @http.method** to open the **Add Facet** window.
    
    Expand **Advanced**. Unselect **Use path as display name** and update **Display Name** to `Method`. Under **Group**, select **Web Access**. Click **Add**. You will see a confirmation message appear that the facet has been created. Close the log details.

    In the facets on the left, notice that **Method** is now listed under **Web Access**. Wait for new logs to come in. Expand the **Method** facet, you will see values listed.


