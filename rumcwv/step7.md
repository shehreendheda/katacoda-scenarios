Up to this point, you’ve been able to both track and verify the optimization of the Storedog app’s Core Web Vital scores. However, the goal for maintaining this process should not result in having to periodically audit an app manually –– rather, the relevant stakeholders of the app should be alerted automatically if the scores and/or progress indicators they care about fall into an unacceptable range. This is what alert monitoring does for you, and is the next logical step in maintaining a valuable UX for your web app over time. 

Let’s set an alert for ...

1. Return to the [Performance Overview Dashboard](link).

    Click the gear icon in the upper right corner of the **Largest Contentful Paint** histogram within the CWVs panel. 
    
    An option to create a new monitor will appear. 
    
    Click **Create monitor**. A new browser tab will open with a RUM monitor.

2. Fill in the fields as follows:

    Under **Define the search query**, the fields are already populated based on the dashbaord widget you used to create the monitor. You do not need to update these.

    Under **Set alert conditions**, leave the selections `above` and `5 minutes` as is. Enter `4000000000`{{copy}} (4000 ms) for **Alert threshold** and `2500000000`{{copy}} (2500 ms) for **Warning threshold**, which are baseline recommendations for LCP.

    Under **Say what's happening**, enter `LCP is higher than recommended threshold for the Storedog app` for the **Monitor Name**. Enter `LCP is higher than recommended thresholds for the Storedog app. Warning threshold is >2500 ms and Alert threshold is >4000 ms.` for the **Monitor Message**. Enter `application_id:storedog`{{copy}}

    Under **Notify your team**, do not make any changes.

    Click **Save**. You will be redirected to the saved monitor.

4. Above the monitor, click **Manage Monitors**. You will see your monitor in the list.

    In the Facets on the left, select `RUM` under **Type**. Scroll up to see that the only monitor in the list is the one you just created.

