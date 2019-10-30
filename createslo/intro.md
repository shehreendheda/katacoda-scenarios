In this activity, you will create an SLO for the fictional ecommerce app, Storedog, to track the SLO that, 99% of time, the p99 latency of viewing the home page should be lower than 6 seconds. Because the SLI is time-based, you will create a Monitor Based SLO.

Monitor Based SLOs can be created from one or more Monitors. In Step 1, you will instrument the Storedog app for monitoring with Datadog. In Step 2, you will explore the metrics available for the app to create the SLI. In Step 3, you will create a Monitor as the SLI for the SLO, and in Step 4, you will create the Monitor Based SLO.

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.

Before you begin, open in a new window/tab the Datadog account/organization that was created for you by learn.datadoghq.com. (To open the correct Datadog organization, you can click Join Account in the email you received in The Learning Environment lesson.)

When you are ready to start, click **Continue**.