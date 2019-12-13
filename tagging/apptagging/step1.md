In the terminal on the right, the Storedog app is being instrumented for monitoring with Datadog. Live traffic to the app is also being simulated. This may take up to 7 minutes.

Once the app is instrumented, you will see the following message in the Terminal: `The environment is prepared! You can now start the activity.`

While you wait for the environment to be prepared, you can explore the APM page in Datadog to see what data comes in for the app.
1. In a new window/tab, log in to the Datadog account/organization that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are coming in. <p> If you are working in a new Datadog Organization, the link will be redirected to the **APM** > **Introduction** page. You will need to wait about two minutes as Datadog's autodiscovery feature picks up the traces that are coming in. In the main menu, when the option appears, click the **APM > Traces** to see the list of traces.

3. In the search field above the Trace list, enter `Env:ruby-shop` if it is not listed. 

4. If no traces are coming in, wait until you see traces coming in.

5. Click some of the traces to see their details. 

6. After you see the "environment is prepared" message in the terminal, click the **storedog** tab on the right to view the Storedag app. <p> As you can see, the the app includes a home page, product pages, advertisements, discounts, and a cart. You  can see traces for these in the **Traces** list in Datadog.

7. Navigate to <a href="https://app.datadoghq.com/apm/" target="_datadog">**APM** > **Services**</a> in Datadog. <p> On the right of the search field above the Services list, if you see a menu for different environments, select the `ruby-shop` environment. <p> Make sure you see the following services in the list before you continue. 

![Service List](tagging/apptagging/service-list.png)

