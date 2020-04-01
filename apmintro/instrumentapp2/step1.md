In the terminal on the right, the Storedog app is being deployed using Docker. Live traffic to the app is also being simulated. This may take up to 3 minutes. Once the app is instrumented, you will see the following message in the terminal: `The environment is prepared!`

1. Wait for the `The environment is prepared!` message to appear.

2. Click the storedog tab above the terminal to view the Storedog app. <p> Clicking around inside the app, you can see it includes a home page, product pages, advertisements, discounts, and a shopping cart. <p> 

In this activity, you will instrument the home page (store-frontend),  discounts, and advertisements services for apm in Datadog. But, lets first enabled trace collection by the Datadog Agent.