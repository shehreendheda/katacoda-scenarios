In this activity, you will observe how the error budget of an SLO is depleted by an app service failure and resolve the failure to restore the error budget.

In Step 1, you will create an Event Based SLO to track that 99.9% of requests to view the home page over 30 days are successful. In Step 2, you will disrupt the app to cause a service to fail and deplete the error budget. And, finally, in Step 3, you will explore the data for the app to identify the cause of failure and resolve it.

The app is built using a Spree (Ruby on Rails) framework along with Flask (Python) microservices for handling coupon codes and ad services and is brought online using a docker container image.

Before you begin, open in a new window/tab the Datadog account/organization that was created for you by learn.datadoghq.com. (You can click Join Account in the email you received in The Learning Environment lesson to open the correct Datadog organization.)

When you are ready to start, click **Continue**.