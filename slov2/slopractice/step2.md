Understanding the user experience in the app is an important step in indentifying SLIs for SLOs. 

Consider what users would do in the app and what critical user journeys should be reliable. For an e-commerce app like Storedog, users would reasonably expect to view the home page, log in, search for items, view item details, manage items in their cart, and check out items for purchase.

Let's create SLOs for two user experiences: viewing the storedog home page and managing items in their cart.

1. Click the **storedog** tab to the right. A new browser tab will open for the Storedog app. 

2. Notice how long it takes the home page to load. 

   If the home page took too long to load, users would not be happy with the app performance. 
   
   An SLO you can create is related to the *latency of viewing the home page*.

   Remember, an SLO includes an SLI target and a time window. 
   
   So, let's create the SLO `*"Over the past 7-days, 99% of the time the p99 latency of a home page request should be lower than 5s."*`

3. Click 2 or 3 different products and add items to the cart.

   If users are unable to add items to a cart, one of the most important user actions in an e-commerce app, users will probably stop using the app. 
   
   An SLO you can create is related to a *successfully managing items in the cart*.

   So, let's create the SLO *`"Over a 7-day period, 99% of requests to the cart will be successful."`*

Now that you've identified SLOs you'd like to create, let's explore the available metrics in Datadog that you can use for SLIs.