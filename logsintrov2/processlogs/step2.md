Once you've created a Pipeline, you can add processors to it based on the log processing needs.

Available processors include the following:

- <a href="https://docs.datadoghq.com/logs/processing/attributes_naming_convention/" target="_blank">Grok Parser</a>, which can extract attributes from semi-structured text messages

- Several remappers that remaps source attributes to target standard attributes

- Category Processor, which enrich logs with attributes that categorize them

- Lookup Processor, which defines a mapping between a log attribute and a human readable value saved in an Enrichment Table (beta) or the processors mapping table.