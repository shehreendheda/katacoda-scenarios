You can use the <a href="https://docs.datadoghq.com/logs/processing/parsing/?tab=filter#using-helper-rules-to-factorize-multiple-parsing-rules" target="_blank">Helper Rules</a> field to define tokens for your parsing rules. Helper rules help you to factorize Grok patterns across your parsing rules. This is useful when you have several rules in the same Grok parser that use the same tokens.

Log 7 - `john id:12345 connected on 11/08/2017 on server XYZ in production`

Log 8 - `jenny doe connected on server ABC in development`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `john id:12345 connected on 11/08/2017 on server XYZ in production`{{copy}} 

    The structure of this log is `user.name user.id 'connected on' connect_date 'on server' server.name 'in' server.env`.

    You can create helper rules for `user`, `connection`, `server`.

    Take a moment to try to create each helper rule. 

3. Click **Advanced Settings** below the **Define parsing rules** field.

    Leave the **Extract from** field blank or enter in `message`.

    In the **Helper Rules** field, copy and paste the following: 
  
    `user %{word:user.name} id:%{integer:user.id}`{{copy}}
    
    `connection connected on %{date("MM/dd/yyyy"):connect_date}`{{copy}}

    `server on server %{notSpace:server.name} in %{notSpace:server.env}`{{copy}}

    Notice that `connected on` is hard-coded into the `connection` helper rule and `on server` and `in` are hard-coded into the `server` helper rule. This is just one set of helper rules you can write. If you created different helper rules in step 2 above, your rules can still be correct as long as the final parsing rule matches the log sample.

    With these helper rules, the parsing rule is `%{user} %{connection} %{server}`.

4.  Clear the **Define parsing rules** field. Then, copy and paste the rule: `rule_7 %{user} %{connection} %{server}`{{copy}}

    ![log7](logsparsing/assets/log7.png)

    The helper rules above help you write a simple parsing rule for logs similar to Log 7. 

    But what about logs like Log 8? Let's modify the helper rules above so that you can use them for logs like Log 8.

5. Below the first log sample under **Log samples**, click **Add**. 

    Copy and paste Log 8 in to the new log sample field: `jenny doe connected on server ABC in development`{{copy}}

    Compare the two log samples. What's different?

    Log 7 looks like `user.name user.id 'connected on' connect_date 'on server' server.name 'in' server.env`.

    Log 8 looks like `user.name user.familyname 'connected on server' server.name 'in' server.env`.

    Notice the following differences:
    
    - Log 7 include `user.name` and `user.id`, while Log 8 includes `user.name` and `user.familyname`.
    
    - Log 7 includes a `connect_date`, while Log 8 does not.
    
    How can you modify the helper rules above to account for these differences and to use the same set of helper rules for types of logs.

6. Let's start with the `user` helper rule. 

    The current helper rule is `user %{word:user.name} id:%{integer:user.id}`.

    Both Log 7 and Log 8 have `%{word:user.name}`, so this element can remain unchanged.

    But, Log 7 has `id:%{integer:user.id}` and Log 8 has `%{word:user.familyname}`.

    Remember, you can use `()?` to make an part of a rule optional. For the helper rule to apply to both Log 7 and Log 8, `id:%{integer:user.id}` and `%{word:user.familyname}` should be optional: `(id:%{integer:user.id})?(%{word:user.familyname})?`

    The `user` helper rule for both logs becomes `user %{word:user.name} (id:%{integer:user.id})?(%{word:user.familyname})?`.

    Delete the `user` helper rule in the **Helper Rules** field, and copy and paste the new `user` helper rule in its place: `user %{word:user.name} (id:%{integer:user.id})?(%{word:user.familyname})?`{{copy}}.

7. Let's consider the `connection` and `server` helper rules.

    The parsing rule for Log 8 does not need to include the `connection` helper rule. But, the word `connected` appears before the `server` information.

    You can create a parsing rule for Log 8 that looks like `%{user} connected %{server}`.

    In the **Define parsing rule** field, copy and paste this rule under the first rule: `rule_8 %{user} connected %{server}`{{copy}}.

    ![log8a](logsparsing/assets/log8a.png)
    
    But, instead of hard-coding the word `connected` into the parsing rule, you can hard-code an optional `connected ` into the `server` helper rule.

    Delete the `server` helper rule in the **Helper Rules** field, and copy and paste the new `user` helper rule in its place: `server (connected )?on server %{notSpace:server.name} in %{notSpace:server.env}`{{copy}}

    Delete `connected` from `rule_8` in the **Define parsing rules** field so that the rule is `rule_8 %{user} %{server}`{{copy}}

    ![log8b](logsparsing/assets/log8b.png)

    With the optional `connect ` in the `server` helper rule, you can update `rule_7` so that it can be used for both Log 7 and Log 8. 

    The difference between `rule_7`  and `rule_8` is `%{connection} `, which you can make optional.

    Delete `rule_8` in the **Define parsing rules** field and update `%{connection} ` in `rule_7` to  `(%{connection} )?` so that the rule becomes `rule_7 %{user} (%{connection} )?%{server}`{{copy}}.

    ![log8c](logsparsing/assets/log8c.png)

    Now you have 3 helper rules and 1 parsing rule for these two different log structures.

As you can see, the Grok Parser in Datadog is designed to help you create multiple parsing rules and helper rules by actively checking and confirming if your rules match your log samples that are filtered into log pipelines.

To help you further with grok parsing logs, Datadog also offers automatic parsing features.

Before you continue to the next step, click **Cancel** in the **New Processor** window. Click the blue toggle button on the right of the `nginx - custom` pipeline to disable the pipeline.

nginx-custom-disabled
![nginx-custom-disabled](logsparsing/assets/nginx-custom-disabled.png)