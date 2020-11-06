Most logs contain dates. However, parsing dates can be complicated given the variety of date formats. You can view the list of date formats in the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#parsing-dates" target="_blank">Parsing dates</a> documentation.

Many logs also contain special characters that require escaping `\character`. These characters are `?`, `[`, `]`, `{`, `}`, `(`, `)`, `>`, `<`, `:`, `=`, `"`, `~`, `/`, and `\`.

Let's parse a log with a date and special characters.

Log 6 - `2000-09-07 14:07:41,508 [main] INFO  MyApp - Entering application.`

Based on the logs you’ve parsed so far, you can refer to the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a> and <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#parsing-dates" target="_blank">Parsing dates</a>  documentation to break the log down to create the rule. Assume that you don’t know how many spaces will be present between each piece of data. Use the `\s+` character between each piece instead of a single space.

| Data | Parsing element |
|------|-----------------|
| 2000-09-07 14:07:41,508 | `%{date("yyyy-MM-dd HH:mm:ss,SSS"):timestamp}\s+` |
| [main] | `\[%{notSpace:logger.thread_name}\]\s+` |
| INFO | `%{word:status}\s+` |
| MyApp | `%{notSpace:logger.name}\s*` |
| - | `-` |
| Entering application. | `%{data}` |

The final rule is `%{date("yyyy-MM-dd HH:mm:ss,SSS"):timestamp}\s+\[%{notSpace:logger.thread_name}\]\s+%{word:status}\s+%{notSpace:logger.name}\s*- %{data}`.

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `2000-09-07 14:07:41,508 [main] INFO  MyApp - Entering application.`{{copy}}.

3. Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_6 %{date("yyyy-MM-dd HH:mm:ss,SSS"):timestamp}\s+\[%{notSpace:logger.thread_name}\]\s+%{word:status}\s+%{notSpace:logger.name}\s*- %{data}`{{copy}}.

    ![log6](logsparsing/assets/log6.png)

4. Test out changing the number of spaces in the log sample. You'll see that the changing the spaces in the log where `\s+` is in the rule does not affect the rule match.


