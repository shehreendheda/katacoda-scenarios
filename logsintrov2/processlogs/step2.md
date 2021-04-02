Once you've created a Pipeline, you can add and edit processors to it based on the log processing needs.

Available processors include the following:

- <a href="https://docs.datadoghq.com/logs/processing/parsing" target="_blank">Grok Parser</a>, which can extract attributes from semi-structured text messages

- Several remappers that remaps source attributes to target standard attributes

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#category-processor" target="_blank">Category Processor</a>, which <a href="https://www.datadoghq.com/blog/how-to-categorize-logs/" target="_blank">enrich logs</a> with attributes that categorize them

- <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#lookup-processor" target="_blank">Lookup Processor</a>, which defines a mapping between a log attribute and a human readable value saved in an Enrichment Table (beta) or the processors mapping table.

Let's take a look at how some of the processors affect how the logs are processed

1. Navigate to the Log List in <a href="https://app.datadoghq.com/logs" target="_blank">**Logs > Search**</a> and filter the list to the `service:store-frontend` logs.

2. Click a log detail that has content `Completed ...`.

    Notice that the `method`, `status_code`, and `path` are listed in the `payload` attributes group. 

    Also, notice that the official log status does not match severity level of the status_code. For example, a `status_code` of `200` should have a `level` of `ok` and a `status_code` of `500` should have a `level` of `error`.

    In the list of facets on the left, expand **Status** under **Core**. Notice that logs with an `OK` status. Expand **URL path** and **Status** under **Web Access**. Notice that there are no values listed.

    The processors in the pipeline will need to be updated so that the logs are processed with these attributes.



