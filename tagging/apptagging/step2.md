Based on how tags are assigned, the metrics, log, and traces data should be linked so that you can jump between related data.

1. In a new window/tab, log in to the Datadog account/organization that was created for you by learn.datadoghq.com. <p> To open the correct Datadog organization, you can click **Login Now** in the “Congrats” email you received after you joined the account/organization.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> in Datadog to view the list of traces that are coming in. <p> If you are working in a new Datadog Organization, the link will be redirected to the **APM** > **Introduction** page. You may need to wait about two minutes as Datadog's autodiscovery feature picks up the traces that are coming in. In the main menu, when the option appears, click the **APM > Traces** to see the list of traces.

3. In the search field above the Trace list, enter `Env:ruby-shop` if it is not listed to make sure that you are only viewing traces for the Storedog app.

4. If no traces are coming in, wait until you see traces coming in.

5. In the search field above the Trace list, start type `service:` next to the `env` tag to see which services appear and select `service:discountsservice`<p> ![servicetag-tracesearch](apptagging/assets/servicetag-tracesearch.png) <p>(Although the `service:postgres` tag was not assigned to traces via a configuration file, the PostgreSQL integration was automatically installed via Autodiscovery and the tags were assigned via integration inheritance.)


