You just listed multiple log samples in the same Grok Parser. You can also list multiple rules in the same Grok Parser. Let's create a Grok Parser for the following log samples. 

Logs - 
``` 
    James 12313 connected in Datadog
    John Doe connected to the instance i-02312vseq123 
	John connected to the instance i-023vseq123 
	James Dean connected to the instance i-02312aavseq123
```

To parse these logs, you can use the two parsing rules you created earlier:

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

7. Repeat step 3 and step 6 for the log samples: `John connected to the instance i-023vseq123`{{copy}} and `James Dean connected to the instance i-02312aavseq123`{{copy}}

    Notice that rule_2 matches for both of these samples. 
    
As you've seen here, you can list log samples and parsing rules for the same log source in one Grok Parser to simplify your log pipelines.

