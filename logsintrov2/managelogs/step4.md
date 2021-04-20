Another feature that gives you (that is, your organization admin) granular control over logs is <a href="https://docs.datadoghq.com/account_management/rbac/permissions/?tab=ui#log-management" target="_blank">Data Access</a>.

Depending on the log data you are collecting in your Datadog organization and the different roles users have, you may want to set role-based read access for logs. 

In Data Access, you can set Unrestricted Access, Restricted Access, and No Access based on user roles (like Datadog Admin Role, Datadog Standard Role, Datadog Read Only Role). 

- **Unrestricted Access** allows read access to all logs.

- **Restricted Access** grants read access to a specified subset of logs.

- **No Access** blocks read access to all logs.

You can build <a href="https://docs.datadoghq.com/logs/guide/logs-rbac-permissions/?tab=ui#create-a-restriction-query" target="_blank">Restriction Queries</a> using log search syntax to specify the subset of logs that different roles/users can view.

Note: Only an existing role can be assigned a Data Access type. You can find an overview of creating and assigning user roles for all of Log Management in the <a href="https://docs.datadoghq.com/account_management/rbac/permissions/?tab=ui#log-management" target="_blank">RBAC Permissions documentation</a> and the <a href="https://docs.datadoghq.com/logs/guide/logs-rbac/?tab=ui#overview" target="_blank">Logs RBAC documentation</a>.

Let's take a look at Data Access in Datadog. 

1. Navigate to <a href="https://app.datadoghq.com/logs/pipelines/data-access" target="_datadog">**Logs > Configuration > Data Access**</a>. 

2. View the different Access lists.

    **Restricted Access** currently has no Restriction Queries and assigned roles listed.

    **Unrestricted Access** has three roles listed: `Datadog Admin Role`, `Datadog Standard Role`, and `Datadog Read Only Role`.

    **No Access** also has no roles.

3. Let's create a Restriction Query for Restricted Access.

    Click **New Query** above the list to open the Create a new Query editor.

    Under Query, enter `env:ruby-shop`. Click **Save**.

    The query `env:ruby-shop` will appear in the **Restricted Access** list. 

4. Let's now assign the restriction query to one of the existing roles. 
    
    Under **Unrestricted Access**, hover over the `Datadog Read Only Role` and click the **Move Role** icon that appears.

    Select `env:ruby-shop` under **Custom**. You'll see that the role is no longer listed under **Unrestricted Access** and that the number of roles assigned to `env:ruby-shop` under **Restricted Access** is now `1`.

    Expand `env:ruby-shop` under **Restricted Access** to see that `Datadog Read Only Role` is listed. Any users assigned this role will now only be able to read logs with the `env:ruby-shop` tag.

    ![dataccess-readonlyrolerestricted](managelogs/assets/dataccess-readonlyrolerestricted.png)

    Hover over `Datadog Read Only Role` again and click the **Move Role** icon. Select `Unrestricted Access` to reassign the role its original access permission.    

5. To clean up the Datadog evironment for future labs, click **Pipelines** in the menu at the top. Hover over the **ruby clone for store-frontend** pipeline and click **Delete** on the right for the pipeline.


### Assessment
Click `grademe`{{execute}} to receive a grade for this activity.