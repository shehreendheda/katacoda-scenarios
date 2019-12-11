Containers Maps give you a big picture of the health of your containers. You can detect outliers, identify usage patterns, avoid resource problems, and make decisions about how to best manage your containers. 

To look at a specific collection of containers, you can use the filter by and group by fields to map the containers based on their assigned tags. 

Note: For any question asked in this section, you can click **Solution** below the instructions to view the answer.

## Using inherited tags
1. In the **group by** field above the <a href=”https://app.datadoghq.com/infrastructure/map?fillby=avg%3Aprocess.stat.container.io.wbps&sizeby=avg%3Anometric&groupby=none&nameby=name&nometrichosts=false&tvMode=false&nogrouphosts=true&palette=green_to_orange&paletteflip=false&node_type=container” target="_datadog">container map</a>, type **kube**. Three tag keys appear in the list (pictured below).

2. View the `lostofpods.yaml`{{open}} file again. As you can see, the `kube_*` tags were not assigned via the pod labels, but were inherited through the Kubernetes Integration. 

3. Select `kube_container_name` and hover over the `my-container` group. <p> How many containers are in this group?

4. Unselect `kube_container_name` and take turns selecting the other `kube_*` tag keys to see how the containers map.

5. In the **filter by** field, type `kube` to see the list of tags for the `kube_*` keys. 

## Using custom tags
Now, let’s start using the custom tags assigned via the pod labels. 
1. Assume this is a deployment for your organization and it is required that any container with the `my-container-` name be assigned an `environment`. Let’s see if any of the containers are not meeting the requirement. <p> Select `kube_container_name:my-container` for **filter by**and `environment` for **group by**.<p> How many containers have `no environment`? Which team(s) do they belong to? Hint: Click the containers with `no environment` and view their tags. 

2. Now, assume you want to know how many containers are running in the `production` environment for each office. <p> Select `environment:production` for **filter by** and `office` for **group by**. <p> Which office is running the most containers? How many containers are they running?

3. Or, assume you want to know more about the container roles for each office in the `qa` environment. <p> Select `environment:qa` for **filter by** and `role`, `office` for **group by**.  <p> How many roles are associated with the qa environment? Which role is at the most offices?


## Adding new tags to a deployment 
 
Let’s introduce another dimension to the tags by adding pods with the tag key `owner` to the deployment.

1. Clear the **filter by** and **group by** fields above the container map.

2. Click the **group by** field and search the list. <p> Do you see the `owner` tag in the **group by** list? *Note: The list is in alphabetical order. Actually, you will find that all list of tags in Datadog is in alphabetical order.*

3. Click `kubectl apply -f taggingk8s/couplemore.yaml`{{execute}} to add more pods/containers to the deployment.

4. Wait until the container map in the UI updates with the new containers. Once the containers are running, you should see 55 containers when there are no filters in the container map. <p>![newcontainers](taggingk8s/assets/new-containers-running.png)

5. Click the **group by** field and search the list. <p> Do you see the owner tag in the group by list?

6. Select `owner` for **group by**. How many uniques values for the owner tag are there? (Hint: **no owner** is not a tag value.)

With inherited tags like `kube_container_name` and custom tags like `environment`, `office`, `team`, etc, think of the different business questions you could ask and answer about the deployment.
 
When you assign tags, remember to consider the scope, functions, and ownership of your deployments. With strategic tagging, you can use the tags to filter and group containers (and hosts) based on your business use cases.
