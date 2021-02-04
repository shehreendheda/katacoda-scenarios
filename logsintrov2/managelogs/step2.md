In addition to indexing logs into value groups for organized, cost-efficient logs workflows, you can archive logs (even those that are filtered and excluded by Indexes) that you don't need on hand all the time, but that you may need to access at a later point in time. 

<a href="https://docs.datadoghq.com/logs/archives" target="_blank">Archives</a> allows you to store logs in a user-provided cloud storage for long-term retention and quick rehydration (more details on the next page) whenever needed.

After logs are ingested and pass through configured processing pipelines, logs matching the filter query in an Archive are sent to a user-defined cloud storage. If you need access to archived logs, you can later <a href="https://docs.datadoghq.com/logs/archives/rehydrating" target="_blank">Rehydrate from Archives</a> (more details on the next page). Note: Archives can only be configured by users with admin permissions. Contact admin users on your team if you’re interested in using Archives for your logs workflows.

Let's take a look at Archives in Datadog. Note: Because a cloud storage option is required, you won't set up an archive, but will go over the different 

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/archives" target="_datadog">**Logs > Configuration > Archives**</a>.

2. Click **New Archives** above the archives list to open the Add an Archive editor. 

    Under **Define which data to store**, enter `env:ruby-shop`{{copy}}, `service:store-frontend`{{copy}}, `status:info`{{copy}} in the **Filter**. Notice the preview list above this field is filtered to the selection.

    Under **Select Archive Type**, select the cloud storage selection you would use for your workflows. The **Configure Bucket** section below expands automatically. Notice the information you'd need to set up the archive storage. Note: Do **not** set up a cloud storage for this exercise because you will incur a cost and this Datadog account may not have the security permissions that your company requires.

    The sections **Name this Archive** and **(Optional) Tags** also expand automatically. These have default settings that you can change. You can click the questions marks next to fields to learn more about them.

    Because you haven't filled in the cloud storage requirement, you can't click Save. That's alright! Click **Cancel**.
    
If you were able to save this archive, you'd be redirected to the Archives list with the new Archive listed, like in the example below. 

    [image]