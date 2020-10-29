Let's restart the Docker deployment to view the logs being collected after you configured the Datadog Agent. 

1. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment. <p> ![restarted-agent-frontend](collectlogsapp/assets/restarted-agent-frontend.png)

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

3. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog to view the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a>. 

4. In the search field, type `env:ruby-shop` if it is not listed so that the Log List displays logs for the storedog app only.

5. In the **Facets** list, expand the **Source** and **Service** lists. **Service** to view the services from the app that are injecting traces into Datadog. 

    ![log-sources](collectlogsapp/assets/log-sources.png)

    ![log-services](collectlogsapp/assets/log-services.png)

6. Click a log (similar to the one shown in the image) for the `store-frontend` service to open the <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the log details. 

    ![store-frontend-log](collectlogsapp/assets/store-frontend-log.png)
    
    Notice that the `source` value is `ecommerce-frontend` and the `service` value is `store-frontend`. 
    
    In the list of Services in the Facets, there are two services related to the frontend service: `ecommerce-frontend` and `store-frontend`. When the logs for the store-frontend are collected they are automatically tagged with `"source": "ecommerce-frontend"` and `"service": "ecommerce-frontend"` based on the `short_image` tag in the **ALL Tags** list. (Refer to the Important Notes under the table in the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation#one-step-install" target="_blank">One-step install Docker Log Collection</a> documentation) However, the `DD_SERVICE=store-frontend` environment variable overrides the initial service tag with the `DD_SERVICE` tag value, so the logs collected from the service are now tagged with `"service": "store-frontend"`. You can refer to the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/?tab=docker#containerized-environment" target="_blank">Unified Service Tagging</a> documentation for more details.

    Also, notice that there is a list of **Event Attributes** and the **Traces** tab shows a linked trace. In the upper right of the trace, you can click **View trace details** to open the trace in a new tab. Below the trace, click the **Logs** tab and then click the log, the same log you were viewing will reopen in the Log Explorer with the Log List filtered on the trace ID. 

    Although, you haven't updated the log configuration for the `frontend` in the docker-compose file, you'll see in the next page how the service has already been configured for log collection with Datadog. 

7.  Click a log for the `advertisements-service` service to open the log details. 

    ![discounts-service-log](collectlogsapp/assets/discounts-service-log.png)
    
    Notice that the `source` value and the `service` value is `discounts-service-fixed` based on the `short_image` tag in the **ALL Tags** list.

    Also, notice that the **Event Attributes** list is empty because the log is not processed. 

8. Click a log for the `discounts-service-fixed` service to open the log details. 

    ![advertisements-service-log](collectlogsapp/assets/advertisements-service-log.png)
    
    Notice that the `source` value and the `service` value is `advertisements-service` based on the `short_image` tag in the **ALL Tags** list.

    Also, notice that the **Event Attributes** list is empty because the log is not processed.
 
As you can see, Datadog is collecting logs from the Agent and from the services in the app, but log configuration for the services is not complete.

Let's go over the log collection configuration of the `store-frontend` service and update the configuration as needed.

