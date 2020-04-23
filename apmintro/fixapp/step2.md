In Datadog, you can create a variety of <a href="https://docs.datadoghq.com/monitors/" target="_datadog">**Monitors**</a> to track the health of your applications and to alert you if action is needed. 

Let's create monitors to track the latency of the storefrontend, discounts, and advertisements services.

#### Storefrontend service

1. In Datadog, navigate to the <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **New Monitor**</a>.

2. Select **APM** from the list of monitor types.

3. Under **Select monitor scope**, select **APM Metrics**. Then, select `storefrontend` as the **Service**, and select `spree::homecontroller_index` as the **Resource**.

4. Under **Set alert conditions**, select **Threshold Alert**. <p>Set the alert as follows: **Alert when `Avg latency` is `above` `1` over the last `1 minute`**.

5. Under **Say what's happening**, leave the message as it. 

6. Under **Notify your team**, delete `@storefrontend`. You will notice that `@storefrontend` is removed from the message in step 5. 

7. Click **Save** in the bottom right. <p> You will be redirected to the new monitor page. Browse the details. <p> Notice that the **Tags** for the service and environment are automatically listed as tags for the monitor. These tags will correlate the monitor to the respective Service Page and Resource Page.

#### Discounts service

1. Continuing from step 7 above, click **New Monitor +** in the top right.

2. Repeat steps 2 - 7 above, but with the following changes. <p> Select `discountsservice` instead of `storefrontend` as the service in steps 3 and 6. <p> Select `get_/discount` as the Resource in step 3.

#### Advertisements service

1. Continuing from step 2 above, click **New Monitor +** in the top right.

2. Repeat steps 2 - 7 for setting up the storefrontend monitor, but with the following changes. <p> Select `advertisementssservice` instead of `storefrontend` as the service in steps 3 and 6. <p> Select `get_/ads` as the Resource in step 3. 

When you view the monitors in <a href="https://app.datadoghq.com/monitors#/create" target="_datadog">**Monitor** > **Manage Monitors**</a>, you'll notice that their status is `No Data`. Because the monitors are new, it may take a few minutes for the status of the monitors to update. 