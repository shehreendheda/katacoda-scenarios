In the terminal on the right, the Storedog app is being instrumented for monitoring with Datadog. Live traffic to the app is also being simulated. This may take up to 7 minutes.

Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared! You can now start the activity.`

While you wait for the environment to be prepared, you can explore the assigned tags for the application.

1. Click `docker-compose.yml`{{open}} to view the file in the editor on the right. <p>The docker-compose.yml instruments the Datadog agent and app build for monitoring with Datadog.

2. Scroll through the file to view the configurations and tag assignments. <p>**Line 11** assigns the `env:` tag to the application. By assigning this tag, all data coming in from the Storedog application is labeled as belonging to the same environment. (To learn more, view the the <a href="https://docs.datadoghq.com/agent/docker/?tab=standard#environment-variables" target="_blank">Docker Agent Setup</a> documentation.) <p> **Lines 19, 40, 60, 81, and 89** assign labels as tags to the logs for the datadog agent, discount service, frontend service, advertisements services, and postgres, respectively. (To learn more, view the the <a href="https://docs.datadoghq.com/agent/docker/log/?tab=dockercompose#activate-log-integrations" target="_blank">Docker Log Collection</a> documentation.)<p>**Lines 26 and 67** assign the `service:` tag to the discount and advertisements services. (To learn more, view the the <a href="https://docs.datadoghq.com/tracing/setup/python/#environment-variable" target="_blank">Tracing Python Applications</a> documentation.)

3. Click `/store-frontend/config/initializers/datadog.rb`{{open}} to view the file that instruments rails for tracing ruby applications. <p>The `service` tags for the the `storefrontend`, `storefrontendcache`, and `storefrontendsqlite` are assigned here. (To learn more, view the <a href="https://docs.datadoghq.com/tracing/setup/ruby/#rails" target="_blank">Tracing Ruby Applications</a> documentation.)

3. After you see the "environment is prepared" message in the terminal, click the **storedog** tab on the right to view the Storedog app. <p> As you can see, the app includes a home page, product pages, advertisements, discounts, and a cart.

<p>Now that the app is ready, let's start exploring the data coming into Datadog.