Now that you're familiar with using matchers, let's look at some other log examples using matchers.

Log 2a - `John Doe connected to the instance i-02312aavseq123`

Log 2b - `John connected to the instance i-023vseq123`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `John Doe connected to the instance i-02312aavseq123`{{copy}}

    The structure of this log looks like  `user.name user.familyname ‘connected to the instance’ instance.name`.

    Take a look at to the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matchers</a> table to find matchers for each of the attributes.

3. You can create a rule with the following matchers for each attribute.

    `user.name` &rarr; `%{word:user.name}`

    `user.familyname` &rarr; `%{word:user.familyname}`

    `instance.name` &rarr; `%{notSpace:instance.name}`
    
    The matcher `notSpace` matches any string value until the next space. The instance name is a collection of characters including letters, numbers, and a dash. The `notSpace` matcher will allow for any instance name to be extracted.

    Putting together the matchers listed above and the text that needs to be hard-coded for these logs, the rule is `%{word:user.name} %{word:user.familyname} connected to the instance %{notSpace:instance.name}.*`. 

    Again, you can end this rule with `.*` to make sure that matching logs will still be parsed even if something follows `instance.name` in the log.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_2 %{word:user.name} %{word:user.familyname} connected to the instance %{notSpace:instance.name}.*`{{copy}}.
    
    ![log2a](logsparsing/assets/log2a.png)

4. Log 2b is variation of Log 2a that does not include the `user.familyname` attribute. Let's create a rule that parses logs that look like Log 2a and Log 2b.

    Click **Add** below the **Log samples** field. Copy and paste this log into the new field: `John connected to the instance i-02312aavseq123`{{copy}}
    
    Notice that the Log 2b does not match the rule you just created. To account for the optional `user.familyname` attribute in Log 2b, the rule for Log 2a can be modified with `()?` around the attribute.

    The rule becomes `%{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`.

    Notice that there is a space between the attribute and the closing parenthesis `..name} )?`. This is to account for the space that would normally follow the attribute if it were present. Parsing rules are strict, so you need to account for every possible character. If a log has an extra space that is not accounted for in the parsing rule, the log can be skipped by the parser.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_2 %{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`{{copy}}.

    ![log2b](logsparsing/assets/log2b_2.png)

    Notice that both log samples match the rule. This is indicated by the label **Match** next to both log samples. You can click each log sample to see the list of extracted attributes below the parsing rule.
