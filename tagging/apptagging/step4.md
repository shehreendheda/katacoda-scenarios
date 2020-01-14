Tags are also facets for list filters throughout Datadog. Let's create two synthetic tests for the Storedog home page to understand tags as facets.  

1. In Datadog, navigate to <a href="https://app.datadoghq.com/synthetics/list" target="_datadog">**UX Monitoring** > **Synthetics Tests**</a>.

2. Click **New Test** in the top right, and select **New API Test**. <p> If you are working in a new Datadog orgnaization, click **Get Started** and then select **New API Test**.

3. Under **Choose Request Type**, select **HTTP**.

4. Under **Make a request**, fill in each field as shown below. <p> **Note**: For **URL**, enter the URL for your Storedog home page. Click the **storedog** tab above the terminal on the right and copy the URL for the storedog home page. Paste this URL in the sythentic test URL field.<p>![syn-makerequest](apptagging/assets/syn-makerequest.png)

5. Click **Alert conditions** to expand the section. Fill in each field as shown below. <p>![syn-alertconditions](apptagging/assets/syn-alertconditions.png)

6. Click **Notify your team** to expand the section. You can leave this section blank, or you can enter a message and select to receive notifications.

7. Click **Create Test**. You will be redirected to the new Synthethic test. <p> You will see a message near the top that you may need to refresh the page after a few minutes once data starts coming in. This is expected. <p> Under **Properties**, you can view the two tags you assigned to the test.

8. Above the test name, click **Synthetics** to navigate to the test list.

9. On the left, expand the **TAGS** facet. <p>You will see menus for the **Env** and **Service** tag keys. These are created because of the tags you assigned to the synthetic test.

10. In the search field above the list of facets, enter `env:"ruby-shop"`. You will see that you can still see the test you created in the list.

11. Create a new test following steps 2 - 8, but name the test `Test on Storedog 2` and do not assign the `env:ruby-shop` tag under **Make a request**.

12. Navigate to **Synthetics** list, and view the **TAGS** facet. Notice the number of tests associated with each tag.

13.  In the search field above the list of facets, enter `env:"ruby-shop"`. Only the `Test on Storedog` test is listed.<p>Assigning relevant tags ensures that you can find all tests associated with each tag and connects your tests to related data throughout Datadog.

14. Navigate to <a href="https://app.datadoghq.com/apm/service/storefrontend/rack.request" target="_datadog">**APM** > **Service** > **storefrontend**</a>.

15. Click the banner near the top labeled **2 ALERT** / **View Monitors -->**. <p>The two synthetic tests you created are listed because both have the `service:storefrontend` tag.

By assigning relevant tags to your Monitors, Synthetics tests, and RUM applications, you can easily search for these monitor in lists and connect these monitors to related data. 