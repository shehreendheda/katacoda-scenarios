You can create one Grok Parser with muliple rules for logs from the same source. Let's use the samples and rules you just created. 

Logs - 
``` 
    James 12313 connected in Datadog
    John Doe connected to the instance i-02312vseq123 
	John connected to the instance i-023vseq123 
	James Dean connected to the instance i-02312aavseq123
```

To parse the logs above, you can use these two parsing rules:

The first log matches rule_1 created for Log 1: `%{word:user.name} %{number:user.id} connected in %{word:application_name}.*`

The second, third, and fourth logs match the rule_2 created for Log 2a and Log 2b: `%{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*`

1. Navigate to the **New Processor** window from the previous page.

2. Clear the **Log samples** field. Then, copy and paste the log: `James 12313 connected in Datadog`{{copy}}.

3. Click **Add** below the first sample. 

    Copy and paste the second log into the new **Log samples** field: `John Doe connected to the instance i-02312vseq123`{{copy}}

4. Clear the **Define parsing rules** field. Then, copy and paste the rules:
    
   ```
   rule_1 %{word:user.name} %{number:user.id} connected in %{word:application_name}.*
   rule_2 %{word:user.name} (%{word:user.familyname} )?connected to the instance %{notSpace:instance.name}.*
   ```{{copy}}

5. Select the first sample under **Log samples**. rule_1 is matched.

    ![logs-rule1](logsparsing/assets/logs-rule1.png)

6. Select the second sample under **Log samples**. rule_2 is matched.

    ![logs-rule2](logsparsing/assets/logs-rule2.png)

7. Repeat step 3 and 6 for the log samples: `John connected to the instance i-023vseq123`{{copy}} and `James Dean connected to the instance i-02312aavseq123`{{copy}}

