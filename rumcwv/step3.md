### Auditing your Web App Synthetically in the Browser
How and where do you correlate Core Web Vitals with your web app’s performance in the browser? A common place to start is within your browser’s dev tools.

The following video shows the steps involved for tracking CWVs in your browser. If you have a Chromium-based browser (Chrome, Edge, Brave, Opera, etc), you can follow the steps below the video to try this out yourself.

1. Open a Chromium-based browser (Chrome, Edge, Brave, Opera, etc).

2. Open a new browser tab and navigate to <a href="https://www.datadoghq.com/" target="_blank">datadoghq.com</a>.

3. Right-click on the page and select ‘Inspect’ to open the developer tools in your browser.

4. Select the ‘Lighthouse’ tab in the developer tools.

5. Click on the ‘Generate Report’ button, and wait for a minute while Lighthouse audits the site.

6. When it’s finished, scroll down to the ‘Performance’ section of the audit report. Note the best-estimate CWV scores that were generated.

    Was the LCP target value is less than 2.5 seconds?

    Was the FID range is around 100 milliseconds or less?

    Was the CLS range is around 0.1 or less?

This is a helpful first step into getting some basic information about your web app’s UX performance. However, this audit produces a generalized report for you through a series of synthetic tests and toggleable factors (good vs. bad network connection, fast vs. slow device, desktop vs. mobile, etc). This is not the same as being able to monitor what your web app’s CWV scores actually are in production though, and in order to do that you’ll need to implement or use a <a href="https://developer.mozilla.org/en-US/docs/Web/Performance/Rum-vs-Synthetic" target="_blank">Real User Monitoring</a> solution.

Note: If you’re new to the developer tools in the browser and you’d like to see a more detailed view of your app’s estimated UX performance and CWV scores, the <a href="https://developer.chrome.com/docs/devtools/evaluate-performance/" target="_blank">dev tools performance tab</a> allows you to profile your app and generate a timeline-oriented flamegraph (vendor independent, and available in all browsers).

Let’s move along and see what tracking CWV scores looks like in production with Datadog’s <a href="https://www.datadoghq.com/product/real-user-monitoring/" target="_blank">Real User Monitoring</a>.
