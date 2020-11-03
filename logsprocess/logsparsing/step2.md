Grok syntax provides an easier way to parse logs than pure regular expressions. You can write parsing rules with the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a>:

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matcher</a> - rule (possibly a reference to another token rule) that describes what to expect (number, word, notSpace, etc.)

- Extract (optional) - an identifier representing the capture destination for the piece of text matched by the Matcher.

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#matcher-and-filter" target="_blank">Filter</a> (optional) -  a post-processor of the match to transform it.

Let's start with a simple example.

Log 1 - `John 12312 connected in Datadog`

1. Navigate to  

The structure of this log looks like  `username userid ‘connected in’ application_name`. 

The important attributes that need to be extracted from any log like this one are `username`, `userid`, and `application_name`, so a rule is needed to extract each attribute from the log. 

Let’s start with `username` and create a simple rule to extract just this attribute from the log. 

Refer to the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matchers and Filters</a> table to find a  matcher for the attribute.

It looks like `word` is a fitting matcher for `username`. 

Also, let's use `user.name` instead of `username` so that you can group `user.name` and `user.id` (instead of `userid`) under the `user` attribute.

The matcher syntax to extract just the `user.name` is then `%{word:user.name}`. 

But, to make sure that all all logs starting with `user.name` are parsed using the rule, add `.*` at the end.

The rule to extract the `user.name` is `%{word:user.name}.*`.

IMAGE

Now, let’s include a matcher for `userid` in the rule. 

Because the `userid` is a simple number, the fitting matcher is `number`. 

Also, let's use `user.id` so that the `userid` is listed as part of the `user` attribute group. 

The matcher syntax is `%{number:user.id}`, so the rule is now `%{word:user.name} %{number:user.id}.*`.

IMAGE

To extract the last attribute in the log, `application_name`, you can use the matcher `word` and the attribute value `application_name`. 

Before adding the matcher syntax to the rule, you need to hard code `'connected in'` into the rule because of the structure of the logs: `username userid ‘connected in’ application_name`. 

The rule becomes `%{word:user.name} %{number:user.id} connected on %{word:application_name}.*`. 



| Attribute | Value | Matcher | 
|-----------|-------|---------|
| username | John | word |
| userid | 12312 | number |
| application_name | Datadog | word |

