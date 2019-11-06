Error budgets of SLOs give you a quantiative measure of how well your services are performing to meet your SLOs. In this activity, you will observe how the error budget of an SLO is affected by an app service failure in the Storedog app and resolve the failure to restore the error budget.

The activity includes the following steps:
1. Instrumenting the Storedog app for monitoring with Datadog. 
2. Creating an Event Based SLO to track that 99% of requests to view the home page are successful over 30 days. 
3. Disrupting the app to cause a service to fail and affect the error budget of the SLO. 
4. Exploring the data in Datadog for the app to identify the cause of failure 
5. Resolving the failure to restore the service and error budget.

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.

Before you begin, in a new window/tab, open the Datadog account/organization that was created for you by learn.datadoghq.com. (To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.)

When you are ready to start, click **Start Scenario**.