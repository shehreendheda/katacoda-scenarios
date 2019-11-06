Error budgets of SLOs give you a quantiative measure of how well your services are performing to meet your SLOs. In this activity, you will observe how the error budget of an SLO is affected by an app service failure in the Storedog app and resolve the failure to restore the error budget.

In Step 1, you will instrument the Storedog app for monitoring with Datadog. In Step 2, you will create an Event Based SLO to track that 99% of requests to view the home page are successful over 30 days. Then, in Step 3, you will disrupt the app to cause a service to fail and affect the error budget of the SLO. And, in Step 4, you will explore the data in Datadog for the app to identify the cause of failure and resolve it.

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.

Before you begin, open in a new window/tab the Datadog account/organization that was created for you by learn.datadoghq.com. (To open the correct Datadog organization, you can click **Join Account** in the email you received from learn.datadoghq.com.)

When you are ready to start, click **Start Scenario**.