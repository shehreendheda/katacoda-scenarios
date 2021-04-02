1. Navigate to the Log List in <a href="https://app.datadoghq.com/logs" target="_blank">**Logs > Search**</a> and filter the list to the `service:store-frontend` logs.

2. Click a log detail that has content `Completed ...`.

    Notice that the official log status does not match severity level of the status_code. For example, a `status_code` of `200` should have a `level` of `ok` and a `status_code` of `500` should have a `level` of `error`.

    In the list of facets on the left, expand **Status** under **Core**. Notice that logs with an `OK` status. 

    The processors in the pipeline will need to be updated so that the logs are processed with these attributes.

3. In the tab/browser with **Logs Configuration**, expand the **ruby clone for store-frontend** pipeline. 

    At the bottom of the processors list, click **Add Processors**. 
    
    Under **Select the processor type**, select `Category Processor`. 
    
    Under **Set target category attribute**, enter `level`. 
    
    Under **Populate category**, enter `@http.status_code:[200 TO 299]` for **All events that match** and `ok` for **Appear under the value name**. Click **Add**. 
    
    Repeat for `@http.status_code:[300 TO 399]` and `notice`, `@http.status_code:[400 TO 499]` and `warn`, and `@http.status_code:[500 TO 599]` and `error`. 
    
    Under **Name the processor**, enter `Assign severity level based on http.status_code`. Click **Save**.

    The processor will appear in the processors list

4. Because the offical log status is assigned based on the `level` attribute, the **Status Remapper** processor must be below the **Category Processor** in the list. 

    Locate the **Status Remapper: Define level as the official status of the log**. 
    
    Click the six dot icon on the right for the processor and drag the processor to below the **Category Processor**. 
    
    In the pop-up window that opens, click **Reorder**. 

5. In the tab/browser with **Logs Search**, wait for new logs to come in. There may be a pause in the log stream as new logs come in. 

    Notice that the logs visualization above the Logs List has different colors in the bars. The `OK` status is indicated by green and is now being assigned as the offical log status for logs with `http.status_code` of `[200 TO 299]`. 
    
    In the facets on the left,, expand **Status** under **Core**. Notice that there the `OK` status is now listed. 
    
    Click a log detail that has content `Completed ...`. Notice that the `level` based on the categories you created and the official log status matches the level listed. Press the up/down arrow keys to view more logs details. Close the log details.


