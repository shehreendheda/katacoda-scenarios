Once you've created Archives, you can "rehydrate" them using Rehydrate from Archives. Log Rehydration\* allows you to recall log events from an Archive so that you can analyze and investigate them in Datadog. 
\*Log Rehydration is a trademark of Datadog, Inc.

In <a href="https://docs.datadoghq.com/logs/archives/rehydrating" target="_blank">Rehydrate from Archives</a>, you can create a <a href="https://docs.datadoghq.com/logs/archives/rehydrating?tab=awss3#historical-views">Historical View</a> that defines the time period, Reload queries, Archive, number of logs, and retention period for the rehydrated logs. You can also set an optional notification so that you know when rehydration is complete. 

Let's take a look at Rehydrate from Archives in Datadog. 

Note: Because a cloud storage option is required and you didn't set up an Archive in the previous page, you won't rehydrate an Archive here, but will go over what's required to rehydrate an Archive.

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/historical-views" target="_datadog">**Logs > Configuration > Rehydrate from Archives**</a>. 

2. Click **New Historical View** above the list to open the Rehydrate from Archive editor. 

    Look over the different fields. Click the question mark icon next to the fields to learn more. You can select the time period of the logs to rehydrate, enter a query to filter the logs, select the archive to rehydrate the logs from, enter details for the historical view you are creating (name, volume, and retention time), and set up a notification so that you can be informed when rehydration is complete.
    
    Again, because you didn't set up an archive, you won't be rehydrating one here. Click **Cancel** to close the editor.

3. If you were able to rehydrate an archive, you'd be redirected to the Historical Views list with the new historical view listed, like in the example below. 

    ![rehydrated-archives-example](managelogs/assets/rehydrated-archives-example2.png)

4. Once logs are rehydrated, you can <a href="https://docs.datadoghq.com/logs/archives/rehydrating?tab=awss3#from-the-log-explorer">select the logs in the Log Explorer</a> under Historical Indexes in the Index facet, like in the example below. 

    ![rehydrated-logs-example](managelogs/assets/rehydrated-logs-example2.png)

With Indexes, Archives, and Rehydrate from Archives, you have granular control over the logs you want available all the time, the logs you want to store long-term, and the archived logs you want to rehydrate when needed.