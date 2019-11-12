In this activity, you will create an SLO that the p99 latency of viewing the home page should be lower than six seconds 99% of the time for the fictional e-commerce app Storedog. Because the SLI is time-based, you will create a Monitor Based SLO. Monitor Based SLOs can be created from one or more Monitors. 

The activity includes the following steps:
1. Instrumenting the Storedog app for monitoring with Datadog
2. Exploring the metrics available for the app to create the SLI
3. Creating a Monitor for the SLI for the SLO
4. Creating the Monitor Based SLO

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.