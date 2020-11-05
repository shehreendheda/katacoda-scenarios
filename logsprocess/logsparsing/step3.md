Now that you're familiar with using matchers, let's look at a few other log examples using matchers.

Log 2_1 - `John Doe connected to the instance i-02312aavseq123`
Log 2_2 - `John connected to the instance i-023vseq123`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `John Doe connected to the instance i-02312aavseq123`{{copy}}

    The structure of the log looks like  user.name user.familyname ‘connected to the instance’ instance.name.

    Take a look at to the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=matcher#matcher-and-filter" target="_blank">Matchers</a> table to find matchers for each of the attributes.

3. You can create a rule with the following matchers for these attributes.

    | Attribute | Data | Matcher | Parsing element |
    |-----------|------|---------|-----------------|
    | user.name | John | word | %{word:user.name} |
    | user.familyname | Doe | word | %{number:user.familyname} |
    | instance.name | i-02312aavseq123 | notSpace | %{notSpace:instance.name} |

    The matcher `notSpace` matches any string until the next space. The instance name is a random collection of characters including alphabets, numbers, and a dash. The `notSpace` matcher will allow for any instance name to be extracted.

    Putting together the matchers listed above and the text that needs to be hard-coded for logs `connected to the instance` with this structure, the rule is `%{word:user.name} %{word:user.familyname} connected to the instance %{notSpace:instance.name}.*`. 

    Again, you can end this rule with `.*` to make sure that matching logs will still be parsed even if something follows `instance.name` in the log.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_2 %{word:user.name} %{word:user.familyname} connected to the instance %{notSpace:instance.name}.*`{{copy}}.
    
    ![log2_1](logsparsing/assets/log2_1.png)

4. Log 2_2 is variation of Log 2_1 that does not include the `user.familyname` attribute. Let's create a rule that takes into account logs with the structures of Log 2_1 and Log 2_2.

    Clear the **Log samples** field. Then, copy and paste the log: `John connected to the instance i-02312aavseq123`{{copy}}
    
    To account for the optional `user.familyname` attribute in Log 2_2, the rule for Log 2_1 can be modified with `( )?` around the attribute.

    The rule becomes `%{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`.

    Notice that there is a space between the attribute and the closing parenthesis `..name} )?`. This is to account for the space that would normally follow the attribute if it were present. Parsing rules are strict, so you need to account for every possible character. If a log has an extra space that is not accounted for in the parsing rule, the log can be skipped for parsing.

    Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_2 %{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`{{copy}}.

    ![log2_2](logsparsing/assets/log2_2.png)

