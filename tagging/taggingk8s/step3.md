<a href="https://docs.datadoghq.com/graphing/dashboards/Dashboards" target="_blank">Dashboards</a> in Datadog allow you to visually track, analyze, and display key performance metrics to help you monitor the health of your infrastructure.

You can use assigned tags to create a variety of graphs and dashboards, with each focusing on certain metrics or resources in your infrastructure. Let's start creating a dashboard for this deployment.
 
1. In Datadog, navigate to <a href="https://app.datadoghq.com/dashboard/lists" target="_datadog">**Dashboards** > **Dashboard List**</a> and click **New Dashboard** in the top right.

2. Enter `Kubernetes Deployment`{{copy}} for the **Dashboard Name** and select **New Timeboard**. <p>Let's graph the filesystem.usage for the community team in each environment. 

3. In the dashboard area, click **Add graph**. Then, click and drag the **Timeseries** tile to the dashboard area.

4. Fill the template as shown in the image below and then click **Done**. Note: Click **Advanced** below the first query to add more queries. Under the queries, change **Display** to `Lines`.<p> ![community-environment-timeseries](taggingk8s/assets/community-environment-timeseries2.png)

5. In the new timeseries graph, click any of the lines and view the options. <p> Say, you want to see which containers the data is related to. 

6. Select **View related hosts**, and in the host map that opens, change **Hosts** to **Containers**. <p> You can see that the `environment` and `team` tags are already selected in **Filter by** because you used these tags to filter the data to create the timeseries graph. With these tags, you can jump between the graph in the dashboard and the associated containers in the container map. <p> Now, let's create a table that lists the memory usage of any or all teams by color (an internal company designation). <p> First, you need to set up the <a href="https://docs.datadoghq.com/tagging/assigning_tags/?tab=agentv6#environment-variables" target="_datadog">template variable</a> that will allow you to select which team’s memory usage you want to view.

5. In the dashboard you created, click **Add Variable +** below the dashboard title. Enter `team` under both **Name** and **Tag or Attribute**. Click **Done**.

6. Click and drag the **Table** tile to the dashboard area. 

7. Fill the template as shown in the image below. Notice that `$team` is now available as an option in your tags filter by and group by lists. Click **Done**.<p> ![community-environment-timeseries](taggingk8s/assets/teams-color-table.png) 

8. At the top of the dashboard, select the different `$team` variable options and see the results for each team in the table you just created.

Consider other metrics that you may want to visualize and track for this kubernetes deployment and continue creating other template variables and graphs in the dashboard using the different tags. 

#### Assessment
When you are finished, click `grademe`{{execute}} to receive a grade for this activity. 