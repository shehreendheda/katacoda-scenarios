To view the logs that are being collected from the application environment, you'll need to restart the Docker deployment. 

1. Click `docker-compose -f docker-compose-no-logs.yml up -d`{{execute}} to restart the docker deployment. 

    ![restarted-agent-frontend](collectlogsapp/assets/restarted-agent-frontend.png)

2. If you have previously used the **Log Explorer** in the Datadog organization you are working in, move on to the next step. 

    If you are working in a new Datadog organization, you have to first enable Log Management before you can continue. Navigate to <a href="https://app.datadoghq.com/logs" target="_datadog">**Logs**</a>. Click **Getting Started**, then click **Getting Started** again.

3. Navigate to the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a> in Datadog to view the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a>. 

4. In the search field, enter `env:ruby-shop` as the search query if it is not listed so that the Log List displays logs for the storedog app only.

5. In the **Facets** list, expand the **Source** and **Service** lists. **Service** to view the services from the app that are injecting traces into Datadog. 

    ![logs-sources-services](collectlogsapp/assets/logs-sources-services.png)

6. Click a log for the `ecommerce-frontend` service that has a structure that is similar to the log in the image below. (Click the image to expand it.)

    ![ecommerce-example-log](collectlogsapp/assets/ecommerce-example-log.png)

    The <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> with the log details will open.

    ![ecommerce-frontend-log2](collectlogsapp/assets/ecommerce-frontend-log2.png)
    
    Notice that the `source` value is `ecommerce-frontend` and the `service` value is `store-frontend`. 
    
    In the list of Services in the Facets, there are two services related to the frontend service: `ecommerce-frontend` and `store-frontend`. When the logs for the store-frontend are collected they are automatically tagged with `"source": "ecommerce-frontend"` and `"service": "ecommerce-frontend"` based on the `short_image` tag in the **ALL TAGS** list. (Refer to the Important Notes under the table in the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=containerinstallation#one-step-install" target="_blank">One-step install Docker Log Collection</a> documentation) However, the `DD_SERVICE=store-frontend` environment variable overrides the initial `"service": "ecommerce-frontend"` tag. You can refer to the <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/?tab=docker#containerized-environment" target="_blank">Unified Service Tagging</a> documentation for more details.

    Notice that there is a list of **Event Attributes** because the log is processed.
    
    Also, notice that the **Traces** tab shows a linked trace. In the upper right of the trace, you can click **View trace details** to open the trace in a new tab. Below the trace, click the **Logs** tab. Notice the `trace_id` filter. Click the log under the filter. The same log you were viewing will reopen in the Log Explorer with the Log List filtered on the `trace_ID`. The `trace_ID` links the log to the corresponding trace in APM. 
    
    You'll see later in the activity how the service has been configured so that the collected logs are processed and correlated to traces.

7. In the <a href="https://app.datadoghq.com/logs" target="_datadog">**Log Explorer**</a>, make sure `env:ruby-shop` is the search query.

8. Click a log for the `discounts-service-fixed` that has a structure that is similar to the log in the image below. 

    ![discounts-example-log](collectlogsapp/assets/discounts-example-log.png)

    The Log Side Panel with the log details will open.

    ![discounts-service-log3](collectlogsapp/assets/discounts-service-log3.png)
    
    Notice that the `source` value and the `service` value is `discounts-service-fixed` based on the `short_image` tag in the **ALL TAGS** list.

    Notice that the **Event Attributes** list is empty because the log is not processed. Logging for the `discounts-service` is configured differently than logging for the `ecommerce-frontend`. You'll see how later in this activity.

    Also, notice that there are no traces correlated with the log. You'll enable log and trace correlation for the service later in the activity.

9. Click a log for the `advertisements-service` that has a structure that is similar to the one shown below. 

    ![ads-example-log](collectlogsapp/assets/ads-example-log.png)

    The Log Side Panel with the log details will open.

    ![advertisements-service-log3](collectlogsapp/assets/advertisements-service-log3.png)
    
    Notice that the `source` value and the `service` value is `advertisements-service` based on the `short_image` tag in the **ALL TAGS** list.

    Also, notice that the **Event Attributes** list is empty because the log is not processed. Logging for the `advertisements-service` is configured differently than logging for the `ecommerce-frontend`. You'll see how later in this activity.

    Also, notice that there are no traces correlated with the log. You'll enable log and trace correlation for the service later in the activity.

As you can see, Datadog is collecting logs from the Agent and from the services in the app, but log collection configuration for the services is not complete.

Let's go over the log collection configuration of the services and update the configuration as needed.

