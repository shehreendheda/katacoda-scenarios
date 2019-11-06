In this activity, you will create an SLO that the p99 latency of viewing the home page should be lower than 6 seconds 99% of time for the fictional ecommerce app Storedog. Because the SLI is time-based, you will create a Monitor Based SLO. Monitor Based SLOs can be created from one or more Monitors. 

The activity includes the following steps:
1. Instrumenting the Storedog app for monitoring with Datadog.
2. Exploring the metrics available for the app to create the SLI. 
3. Creating a Monitor for the SLI for the SLO
4. Creating the Monitor Based SLO.

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.

Before you begin, in a new window/tab, open the Datadog account/organization that was created for you by learn.datadoghq.com. (To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.)

When you are ready to start, click **Start Scenario**.