Grok syntax provides an easier way to parse logs than pure regular expressions. You can write parsing rules with the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a>:

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matcher</a> - rule (possibly a reference to another token rule) that describes what to expect (number, word, notSpace, etc.)

- Extract (optional) - an identifier representing the capture destination for the piece of text matched by the Matcher.

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#matcher-and-filter" target="_blank">Filter</a> (optional) -  a post-processor of the match to transform it.

Let's start with a simple example for using matchers: `%{matcher:attribute}`.

Log 1 - `John 12312 connected in Datadog`

1. Navigate to the **New Processor** window from the previous page.

2. Click the log to copy it and paste it into the **Log samples** field: `John 12312 connected in Datadog`{{copy}} 

    The structure of this log looks like  `username userid ‘connected in’ application_name`. 

    The important attributes that need to be extracted from any log like this one are `username`, `userid`, and `application_name`, so a rule is needed to extract each attribute from the log. 

3. Let’s start with `username` and create a simple rule to extract just this attribute from the log. 

    Refer to the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matchers and Filters</a> table to find a  matcher for the attribute.

    It looks like `word` is a fitting matcher for `username`. 

    Also, let's use `user.name` instead of `username` so that you can group `user.name` and `user.id` (instead of `userid`) under the `user` attribute.

    The matcher syntax to extract just the `user.name` is then `%{word:user.name}`. 

    But, to make sure that all all logs starting with `user.name` are parsed using the rule, add `.*` at the end.

    The rule to extract the `user.name` is `%{word:user.name}.*`.

    In the **Define parsing rules** field of the Grok Parser, copy and paste this rule: `rule_1 %{word:user.name}.*`{{copy}}.

    ![log1-username](logsparsing/assets/log1-username.png)

    Notice the message below the field. The rule matches the log sample.

    Try deleting `.*` from the rule. You'll see that the rule does not match because the text after the `user.name` is not accounted for.

4. Now, let’s include a matcher for `userid` in the rule. 

    Because the `userid` is a simple number, the matcher is `number`. 

    Also, let's use `user.id` so that the `userid` is listed as part of the `user` attribute group. 

    The matcher syntax is `%{number:user.id}`, so the rule is now `%{word:user.name} %{number:user.id}.*`.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_1 %{word:user.name} %{number:user.id}.*`{{copy}}.
    
    ![log1-username-userid](logsparsing/assets/log1-username-userid.png)

    Notice the message below the field. The rule matches the log sample.

5. To extract the last attribute in the log, `application_name`, you can use the matcher `word` and the attribute value `application_name`. 

    Before adding the matcher syntax to the rule, you need to hard code `connected in` into the rule because of the structure of the logs: `username userid ‘connected in’ application_name`. 

    The rule becomes `%{word:user.name} %{number:user.id} connected in %{word:application_name}.*`. 

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_1 %{word:user.name} %{number:user.id} connected in %{word:application_name}.*`{{copy}}.
    
    ![log1-username-userid-appname](logsparsing/assets/log1-username-userid-appname.png)




