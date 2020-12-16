Many logs contain key-value pairs.

The <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">matcher</a> for key-value pairs is `data` and matches any string including spaces and newlines. 

To account for the variations in key-value pairs, you need to include the `key-value` core <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#matcher-and-filter" target="_blank">filter</a>: `keyvalue([separatorStr[, characterWhiteList[, quotingStr[, delimiter]]]])`

The filter accounts for the following:

| Character type | Description |
|--------------|----------|
| separatorStr | Defines the separator between key and values. Defaults to `=` |
| characterWhiteList | Defines extra non-escaped value chars in addition to the default `\\w.\\-_@`. Used only for non-quoted values (e.g. `key=@valueStr`) |
| quotingStr | Defines quotes, replacing the default quotes detection: `<>`, `""`, `''` |
| delimiter | Defines the separator between the different key values pairs (e.g. <code>&#124;</code> is the delimiter in `key1=value1`<code>&#124;</code>`key2=value2`). Defaults to `(normal space)` , `,` and `;` |

Let's use the key-value filter to create rules for the following logs.

Log 3 - `user=john action=connection app=datadog page=logs`

Log 4 - `user: john connect_date: 11/08/2017 id: 123 action: click`

Log 5 -  `url=https://app.datadoghq.com/event/stream user=john`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `user=john action=connection app=datadog page=logs`{{copy}}.

    The `key-value` filter defaults to a separatorStr `=` and delimiter `(normal space)`, so you can use the syntax `%{data::keyvalue}` for the rule.
    
    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_3 %{data::keyvalue}`{{copy}}.

    ![log3_1](logsparsing/assets/log3_1.png)

    But, say, you want to extract these key value pairs under the attribute `user_info`, you can include the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#parsing-a-specific-text-attribute" target="_blank">**Extract**</a> option in the syntax: `%{data:user_info:keyvalue}`

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_3 %{data:user_info:keyvalue}`{{copy}}.

    ![log3_2](logsparsing/assets/log3_2.png)

3. If you have logs that do not use `=` as a separator, you should modify the filter.

    Clear the **Log samples** field. Then, copy and paste the log: `user: john connect_date: 11/08/2017 id: 123 action: click`{{copy}}.

    The separatorStr is `: ` so the rule for this logs should have the syntax `%{data::keyvalue(“: “)}`.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_4 %{data::keyvalue(": ")}`{{copy}}.
    
    ![log4](logsparsing/assets/log4.png)

4. If there are logs with special characters, you can add the whitelist to the filter.

    Clear the **Log samples** field. Then, copy and paste the log: `url=https://app.datadoghq.com/event/stream user=john`{{copy}}.

    The separatorStr is `=` and the characterWhiteList is `/:`, so the rule has the syntax `%{data::keyvalue("=","/:")}`.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_5 %{data::keyvalue("=","/:")}`{{copy}}.

    ![log5](logsparsing/assets/log5.png)

You can view more `key-value` examples listed in the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#key-value-or-logfmt" target="_blank">Parsing</a> documentation. 