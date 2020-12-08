When you reviewed the docker-compose file for the app, you looked at the environment variables and docker labels that eassigned the `env`, `service`, and `version` tags for <a href="https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging?tab=docker" target="_blank">unified service tagging</a>. Unified service tagging allows you to investigate and monitor application data throughout Datadog based on deployment version.Let's see these tags in action. 

In the terminal on the right, new version of the app is coming online. You will see the following message in the terminal when it is ready: `The environment is prepared! You can now start the activity.`

In the meantime, let's compare the new version of the app with the first version to see what is different.

1. Click `docker-compose-fixed.yml`{{open}} to open the docker-compose file for the original version of the app. 

2. Click `docker-compose-broken.yml`{{open}} to open the docker-compose file for the new version of the app.

3. Compare the two files. You'll notice that the images for the discounts and the frontend service in the new version are labeled "fixed".

    Also notice the differences between these lines in each file: **Lines 27-29, 45-47, 54-56, 74-76, 84-86, and 102-104**. The version numbers for the discounts and frontend service are different.

4. After you see the "environment is prepared" message in the terminal, navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a>. Select **discounts-service**.

5. Click the **Total Requests** menu and select **Total Requests by Version**. Click the **Total Errors** menu and select **Total Errors by Version**. Notice that there is data for the two versions of the service: `1.0` and `1.1`.

6. Scroll down to the **Deployments** list. You'll see the `1.0` and `1.1` deployments listed.

7. In the **Endpoints** list, select **GET /discount** to go to the resource page.

8. Scroll down to the list of **Traces**. Expand the **Version** facet. 

    Select version `1.0`. Notice the listed durations.

    Select version `1.1`. Notice the listed durations.

    _Looks like the new version of the discounts-service has increased latency that can impact user experience. The deployment can be rolled back, fixed, and then redeployed or a new fix/version can be pushed._

9.  Navigate to <a href="https://app.datadoghq.com/apm/services" target="_datadog">**APM** > **Services**</a>. Select **store-frontend**.

10. Click the **Total Requests** menu and select **Total Requests by Version**. Click the **Total Errors** menu and select **Total Errors by Version**. 

    Notice that there is data for the two versions of the service: `1.0` and `1.1`.

    Compare the total requests data and the total errors data along the timeline. Notice that the errors for version `1.1` are more spread out. 

    _Looks like the new version of the store-frontend has errors built in that can impact user experience. The deployment can be rolled back, fixed, and then redeployed or a new fix/version can be pushed._ 


 

#### Assessment
When you are finished, click `grademe`{{execute}} to receive a grade for this activity. 