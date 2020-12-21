Grok syntax provides an easier way to parse logs than pure regular expressions. You can write parsing rules with the <a href="https://docs.datadoghq.com/logs/processing/parsing/overview" target="_blank">%{MATCHER:EXTRACT:FILTER} syntax</a>:

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matcher</a> - rule (possibly a reference to another token rule) that describes what type of element (number, word, notSpace, etc.) to expect for an attribute

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#parsing-a-specific-text-attribute" target="_blank">Extract</a> (optional) - an identifier representing the capture destination for the element matched by the matcher.

- <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#matcher-and-filter" target="_blank">Filter</a> (optional) -  a post-processor that transforms the element

The parsing rule for a log should account for all characters, spaces, and strings in the log.

Let's start with a simple example of using matchers `%{matcher:attribute}` to parse the following log.

Log 1 - `John 12312 connected in Datadog`

1. Navigate to the **New Processor** window from the previous page.

2. Click the log `John 12312 connected in Datadog`{{copy}} to copy it. Paste it into the **Log samples** field. 

    The structure of this log looks like  `username userid ‘connected in’ application_name`. 

    The important attributes that need to be extracted from any log like this one are `username`, `userid`, and `application_name`, so a rule is needed to extract each attribute from the log. 

3. Let’s start with `username` and create a simple rule to extract just this attribute from the log. 

    Actually, let's use `user.name` instead of `username` so that you can list `user.name` under the `user` attribute group.
    
    The matcher `word` from the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matchers</a> table is a good fit for `user.name`. The matcher syntax is `%{word:user.name}`. 

    To complete the rule and make sure that all logs starting with `user.name` are parsed using the rule, you should add `.*` at the end: `%{word:user.name}.*`. Without `.*`, the rule would only match a log with the structure `user.name`. With `.*`, the rule match any log with the structure `user.namexxxx` where xxxx is any string of characters and spaces.

    In the **Define parsing rules** field of the Grok Parser, copy and paste the rule: `rule_1 %{word:user.name}.*`{{copy}}.

    Notice the message below the field. The rule matches the log sample.

    ![log1-username](logsparsing/assets/log1-username.png)

    Try deleting `.*` from the rule. You'll see that the rule no longer matches because the text after the `user.name` is not accounted for.

4. Now, let’s include a matcher for `userid` in the rule. 

    Again, let's use `user.id` so that the `userid` is listed as part of the `user` attribute group. 

    Because  `user.id` is a simple number, the matcher is `number`. 

    The matcher syntax is `%{number:user.id}`, so the rule is now `%{word:user.name} %{number:user.id}.*`.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_1 %{word:user.name} %{number:user.id}.*`{{copy}}.
    
    ![log1-username-userid](logsparsing/assets/log1-username-userid.png)

    Notice the message below the field. The rule matches the log sample.

5. To extract the last attribute in the log, `application_name`, you can use the matcher `%{word:application_name}`. 

    Before adding the matcher syntax to the rule, you need to hard code `connected in` into the rule because the structure of the log is `username userid ‘connected in’ application_name`. 

    The rule becomes `%{word:user.name} %{number:user.id} connected in %{word:application_name}.*`. 

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_1 %{word:user.name} %{number:user.id} connected in %{word:application_name}.*`{{copy}}.
    
    ![log1-username-userid-appname](logsparsing/assets/log1-username-userid-appname.png)
