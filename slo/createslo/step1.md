In the Terminal on the right, the Storedog app is being instrumented for monitoring with Datadog. This may take up to 7 minutes.

Once the app is instrumented, you will see the following message in the Terminal: `The environment is prepared! You can now start the activity.`

While you wait for the environment to be prepared, you can explore the APM page in Datadog to see what data comes in for the app.
1. In a new window/tab, open the Datadog account/organization that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.
2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are coming in. <p> If you are working in a new Datadog Organization, click **Get Started** in the APM page. Then, in the main menu, click the **APM > Traces** to see the list of traces. You may need to refresh the page.
3. If no traces are coming in, wait until you see traces coming in.
4. Note the **Services**of the different traces. 

After you see the environment is prepared message in the terminal, you can browse the app and confirm that data from all services is coming into Datadog. 
1. Click the **storedog** tab on the right to view the app once docker-compose has finished. <p> As you can see, the user journey for the app includes viewing the home page and clicking and viewing products, advertisements, discounts, and the cart.
2. Navigate to <a href="https://app.datadoghq.com/apm/" target="_datadog">**APM** > **Services**</a> in Datadog. <p> You should see the services below in the list. 

![Service List](createslo/assets/service-list.png)

Now that the environment is ready, let’s get started with creating SLOs.