Error budgets of SLOs provide a quantiative measure of how well your services are performing to meet your SLOs. In this activity, you will observe how the error budget of an SLO is affected by a service failure in the Storedog app and resolve the failure to restore the error budget.

The activity includes the following steps:
1. Instrumenting the Storedog app for monitoring with Datadog 
2. Creating an Event Based SLO to track that 99% of requests to view the home page are successful over 30 days 
3. Interrupting the app service to affect the error budget of the SLO
4. Exploring the app data in Datadog to identify the cause of failure 
5. Resolving the failure to restore the service and the error budget

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.