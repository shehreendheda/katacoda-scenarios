### Answers

#### Using inherited tags
#3 How many containers are in this group? **49 containers**
<p>
![my-containers](taggingk8s/assets/groupby-kube-container-name.png)

#### Using custom tags
#1 How many containers have no *environment* tag? **1 container** 
   <p>Which team(s) do they belong to? **dev**
<p>
![no-environment](taggingk8s/assets/no-environment-container.png)
<p>
#2 Which office is running the most containers? **nyc** 
   <p>How many containers are they running? **6 containers**
<p>
![productionbyoffice](taggingk8s/assets/production-office-groups.png)
<p>
#3 How many roles are associated with the qa environment? **4 roles**
   <p>Which role is at the most offices? **web**
<p>
![qabyroleoffice](taggingk8s/assets/qa-role-office-groups.png)
<p>
### Adding new tags to a deployment
#2 Do you see the *owner* tag in the group by list? **No**
<p>
![noowner](taggingk8s/assets/no-owner-tag.png)
<p>
#4 Do you see the *owner* tag in the group by list? **Yes**
<p>
![owner](taggingk8s/assets/owner-tag.png)
<p>
#6 How many uniques values for the *owner* tag are there? **2 values**
<p>
![groupbyowner](taggingk8s/assets/owner-tag.png)
<p>