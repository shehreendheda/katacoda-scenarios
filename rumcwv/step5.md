Now let’s walk through a version of Storedog that has some performance issues that are generating some bad CWV scores.

1. We’re able to pinpoint these scores by first integrating Datadog’s Real User Monitoring (RUM) here in the [app](link to application.html.erb file, in ‘instrumented-fixed’ version that contains a block of bad code).

    Adding RUM to Storedog like this propagates every user’s session performance information up to Datadog, and this helps us retain and analyze not only the app’s CWV scores –– but every aspect of performance timing that is relevant to both the UX, and business concerns.

2. [Click here](link to RUM overview page with set time duration) to view the RUM overview page for Storedog.

    You can now review Storedog’s Core Web Vital P75 scores, and as you can see: the LCP score is much higher than it should be. If you click the ‘Device Type’ button in the filtering panel at the top of this view –– you also see how this CWV score differed between Mobile and Desktop environments.

3. Navigate to the [Performance Overview Dashboard](link to this app’s Performance Dashboard). Here we can see these CWV scores in the context of the overall UX performance of the app, and immediately correlate it with the P75 average loading time the app had during this duration of time. Still, the CWV scores are not where they should be, yet.

