Datadog automatically parses JSON-formatted logs to extract attributes. For logs with other formats, Datadog has a <a href="https://docs.datadoghq.com/logs/processing/processors/?tab=ui#grok-parser" target="_blank">Grok Parser</a> that can be added to <a href="https://docs.datadoghq.com/logs/processing/pipelines/" target="_blank">Pipelines</a> to help extract attributes.

Grok syntax provides an easier way to parse logs than pure regular expressions. You can write parsing rules with the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a>:

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matcher</a> - rule (possibly a reference to another token rule) that describes what to expect (number, word, notSpace, etc.)

- Extract (optional) - an identifier representing the capture destination for the piece of text matched by the Matcher.

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#matcher-and-filter" target="_blank">Filter</a> (optional) -  a post-processor of the match to transform it.

In this activity, you'll practice creating parsing rules in Datadog using the Grok Parser.

When you are ready to continute, click **Start Scenario**.