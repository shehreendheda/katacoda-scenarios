In the terminal on the right, the Storedog app is being instrumented for monitoring with Datadog. Live traffic to the app is also being simulated. This may take up to seven minutes.

Once the app is instrumented, you will see the following message in the Terminal: `The environment is prepared! You can now start the activity.`

While you wait for the environment to be prepared, you can explore the APM page in Datadog to see what data comes in for the app.
1. In a new window/tab, log in to the Datadog account/organization that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are coming in. <p> If you are working in a new Datadog Organization, click **Get Started** in the APM page. Then, in the main menu, click the **APM > Traces** to see the list of traces. You may need to refresh the page.

3. In the search field above the Trace list, enter `Env:ruby-shop` if it is not listed.

4. If no traces are coming in, wait until you see traces coming in.

5. Observe the details of the traces.

6. After you see the "environment is prepared" message in the terminal, click the **storedog** tab on the right to view the Storedag app. <p> As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart. *Can you see traces for these in the **Traces** list in Datadog?*

7. Navigate to <a href="https://app.datadoghq.com/apm/" target="_datadog">**APM** > **Services**</a> in Datadog. <p> On the right of the search field above the Services list, if you see a menu for different environments, select the `ruby-shop` environment. <p> Make sure you see the following services in the list before you continue. 

![Service List](createslo/assets/service-list.png)

Now that the environment is ready, let’s start exploring the metrics to create the SLO.