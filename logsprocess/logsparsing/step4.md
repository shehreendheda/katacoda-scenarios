Because Log 1, Log 2, and Log 3 are from the same source, you can create one Grok Parser for them. The parser should list all rules to match each of these log structures. 

Logs - 
``` 
    James 12313 connected in Datadog
    John Doe connected to the instance i-02312vseq123 
	John connected to the instance i-023vseq123 
	James Dean connected to the instance i-02312aavseq123
```

The first log matches the rule_1 created for Log 1: `%{word:user.name} %{number:user.id} connected in %{word:application_name}.*`

But the second, third, and forth logs all match the rule_2 created for Log 2a and Log 2b: `%{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`

To parse the logs above, you can use these two parsing rules:

`rule_1 %{word:user.name} %{number:user.id} connected in %{word:application_name}.*`

`rule_2 %{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `James 12313 connected in Datadog`{{copy}}.

3. Click **Add** below the first sample. 

4. Copy and paste the second log into the new **Log samples** field: `John Doe connected to the instance i-02312vseq123`{{copy}}

5. Clear the **Define parsing rules** field. Then, copy and paste the rules:
    
    ```
    rule_1 %{word:user.name} %{number:user.id} connected in %{word:application_name}.*
    rule_2 %{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*
    ```{{copy}}

6. Select the first sample under **Log samples**. rule_1 is matched.

    ![logs-rule1](logsparsing/assets/logs-rule1.png)

7. Select the second sample under **Log samples**. rule_2 is matched.

    ![logs-rule2](logsparsing/assets/logs-rule2.png)

