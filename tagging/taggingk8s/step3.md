Dashboards in Datadog allow you to visually track, analyze, and display key performance metrics to help you monitor the health of your infrastructure.

You can use assigned tags to create a variety of graphs and dashboards, each of which can focus on certain metrics or resources in your infrastructure.

 
1. In Datadog, navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards** > **Dashboard List**</a> and click **New Dashboard** in the top right.

2. Enter `My Kubernetes Deployment` for the **Dashboard Name** and select **New Timeboard**. <p>Let's graph the filesystem.usage for the community team in each environment. 

3. In the dashboard area, click **Add graph**. Then, click and drag the **Timeseries** tile to the dashboard area.

4. Fill the template as shown in the image below and then click **Done**. Note: Click **Advanced** below the first query to add more queries. Under the queries, change **Display** to `Lines`.<p> ![community-environment-timeseries](taggingk8s/assets/community-environment-timeseries.png)

5. In the new timeseries graph, click any of the lines and view the options. <p> Say, you want to see which containers the data is related to. 

6. Select **View related hosts**, and in the host map that opens, change **Hosts** to **Containers**.<p> With the `environment` and `team` tags, you jump between the graph in the dashboard and the associated containers in the container map. <p> Now, let's create a table that lists the memory usage of any or all teams by color (an internal company designation). <p> First, you need to set up the <a href="https://docs.datadoghq.com/tagging/assigning_tags/?tab=agentv6#environment-variables" target="_datadog">template variable</a> that will allow you to select which team’s memory usage you want to view.

5. Below the Dashboard title, click **Add Variable +**. Enter `team` under **Name** and **Tag or Attribute**. Click **Done**.

6. Click and drag the **Table** tile to the dashboard area.

7. Fill the template as shown in the image below and then click **Done**. <p> ![community-environment-timeseries](taggingk8s/assets/teams-color-table.png) 

8. At the top of the dashboard, select the different `$team` variable options and see the results for each team.

You can continue creating other template variables and graphs for the dashboard using the different tags. Consider other metrics that you may want to visualize and track for this kubernetes deployment.

#### Assessment
Click `grademe`{{execute}} to receive a grade for this activity.