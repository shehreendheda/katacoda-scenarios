<a href="https://docs.datadoghq.com/graphing/infrastructure/containermap/" target="_blank">Containers Maps</a> give you the big picture about the health of your containers. You can detect outliers, identify usage patterns, avoid resource problems, and make decisions about how to best manage your containers. 

To look at a specific collection of containers, you can use the **Filter by** and **Group hosts by Tags** fields to map the containers based on their assigned tags. 

With inherited tags like `kube_container_name` and custom tags like `environment`, `office`, `team`, etc, think of the different business questions you could ask and answer about this deployment. Let's explore how we can filter and group the containers using these tags.

Note: As you go through the steps below, you can note down your answers to the questions. At the bottom of the page, you can click **Solution** to view the answers.

## Using inherited tags
1. For the container map in the previous step, type **kube** in the **Group hosts by Tags** field. Three tag keys appear in the list (pictured below).

2. View the tags in `lotsofpods.yaml`{{open}} file again. As you can see, the `kube_*` tags were not assigned via the pod labels, but were inherited through the Kubernetes Integration. 

3. Select `kube_container_name` in the **Group hosts by Tags** list and hover over the `my-container` group. <p> How many containers are in this group?

4. Unselect `kube_container_name` and take turns selecting the other `kube_*` tag keys to see how the container map changes.

5. In the **Filter by** field, type `kube` to see the list of tags for the `kube_*` keys. 

## Using custom tags
Now, let’s start using the custom tags assigned via the pod labels. 
1. Assume this is a deployment for your organization and it is required that any container with the `my-container-*` name be assigned an `environment`. Let’s see if any of the containers are not meeting the requirement. <p> Select `kube_container_name:my-container` for **Filter by** and `environment` for **Group hosts by Tags**.<p> How many containers have `no environment`? Which team(s) do they belong to? Hint: Click the containers with `no environment` and view their tags. 

2. Now, assume you want to know how many containers are running in the `production` environment for each office. <p> Select `environment:production` for **Filter by** and `office` for **Group hosts by Tags**. <p> Which office is running the most containers? How many containers are they running?

3. Assume you want to know which containers in the `qa` environment have a certain role at each office. <p> Select `environment:qa` for **Filter by**. Select `role` then add `office` for **Group hosts by Tags**.  <p> How many roles are associated with the qa environment? Which role is at the most offices?


## Adding new tags to a deployment 
 
Let’s introduce another dimension to the tags by adding pods with the tag key `owner` to the deployment.

1. Clear the **Filter by** and **Group hosts by Tags** fields above the container map.

2. Click the **Group hosts by Tags** field and search the list. <p> Do you see the `owner` tag in the **Group hosts by Tags** list? *Note: The list is in alphabetical order. Actually, you will find that any list of tags in the Datadog UI is in alphabetical order.*

3. Click `kubectl apply -f taggingk8s/couplemore.yaml`{{execute}} to add more pods/containers to the deployment.

4. Wait until the container map in the UI updates with the new containers. Once the new containers are running, you should see 55 containers when there are no filters in the container map. <p>![newcontainers](taggingk8s/assets/new-containers-running.png)

5. Click the **Group hosts by Tags** field and search the list. <p> Do you see the owner tag in the group by list?

6. Select `owner` for **Group hosts by Tags**. <p>How many uniques values for the owner tag are there? (Hint: `no owner` is not a tag value.)

These are just a few examples of how you can use tags to filter and group containers to learn valuable information about the infrastructure.

 When you assign tags, remember to consider the scopes, functions, and ownerships of the different parts of your deployments. With strategic tagging, you can use the tags to filter and group your containers (and hosts) based on your use cases and end users.
