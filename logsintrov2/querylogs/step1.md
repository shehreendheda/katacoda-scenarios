The <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Search</a> view in <a href="https://docs.datadoghq.com/logs/explorer/" target="_blank">Logs</a> is the <a href="https://docs.datadoghq.com/logs/explorer/list/" target="_blank">Log List</a> that displays indexed logs matching a search context (a search query for a selected time range). You can use the search field and the Facets list (on the left of the Log List) to create a search query to filter the Log List. 

[Screenshot/gif]

A search query can include assigned tags like environment and service, attributes extracted from the logs like status, and text strings from log messages. Search queries built in the search field require proper <a href="https://docs.datadoghq.com/logs/search_syntax/" target="_blank">search syntax</a>.

When you click a log in the Log List, the <a href="https://docs.datadoghq.com/logs/explorer/#the-log-side-panel" target="_blank">Log Side Panel</a> opens with the log details including assigned tags, the log message, any extracted attributes, related traces, and related infrastructure metrics.

Common tags and attributes appear in the <a href="https://docs.datadoghq.com/logs/explorer/facets/" target="_blank">Facets</a> list on the left of the Log List automatically. But, to add or edit a tag or attribute to the Facets panel, click the corresponding tag or attribute in a log detail and select Create/Edit Facet. To save a search query, you can click Save As above the search field. You can find the saved search query in the list of <a href="https://docs.datadoghq.com/logs/explorer/saved_views/" target="_blank">Saved Views</a> (on the left of the Log List).

It’s important to remember, though, that the tags and attributes available to you for creating search contexts and analytics depends on the tags you assign to the logs and the attributes you extract from the logs.


[Screenshot/gif]

When you select the <a href="https://docs.datadoghq.com/logs/explorer/live_tail/" target="_blank">Live Tail</a> time range, you can view all logs ingested by Datadog after processing, but before indexing (or archiving). These logs do not persist, so you can’t see past logs that have been displayed. A search query in Live Tail displays all live logs that match the query. 
