In the terminal on the right, the Storedog app is being instrumented for APM with Datadog. Live traffic to the app is also being simulated. This may take up to two minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

Let's make sure that the app environment comes online successfully and you are collecting app data in the Datadog.

1. In a new browser window/tab, log in to the <a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created for you by learn.datadoghq.com.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are being ingested for the storedog app. 
   
   If you are working in a new Datadog organization, the link will be redirected to the **APM** > **Introduction** page. You may need to wait about two minutes as Datadog's Autodiscovery feature detects the traces that are coming in. In the main menu, when the option appears, click the **APM > Traces** to see the list of traces.

3. In the search field, enter `env:ruby-shop` (if it is not listed) to make sure that you are only viewing traces for the Storedog app. 

4. Under **Facets**, expand **Env** and **Services**. 

   Make sure that `ruby-shop` is the only env selected so that you are only viewing traces for the Storedog app
   
   Make sure the services shown below are listed. Click each and make sure that you are collecting live traces from them.
   
   <p> ![trace-services](fixapp/assets/trace-services.png)

With Datadog collecting data from the Storedog app, let's start exploring the data to select SLIs.