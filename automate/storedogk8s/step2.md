We are now going to deploy Datadog in our cluster to start monitoring our infrastructure and applications.

Log into [Datadog](https://app.datadoghq.com/) and navigate to the [API seetings page](https://app.datadoghq.com/account/settings#api) to reveal your API key. Then, add your Datadog API key to the secrets. You can do this executing the following command in the terminal:

```
$ kubectl create secret generic datadog-secret --from-literal api-key=<YOUR_DATADOG_API_KEY>
```

This will create a Kubernetes secret to make sure the Datadog agent is able to send data to your Datadog account.

Check that the secret has been correctly created by running the following command: `kubectl get secret datadog-secret`{{execute}} You should get an output similar to the following:

```
NAME             TYPE      DATA      AGE
datadog-secret   Opaque    1         8s
```

To deploy the Datadog agent, first we need to create the service account that will be used by the agent and give it the right RBAC persmissions.

In the editor, open the file called `serviceaccount.yaml` and browse it a bit. You can see that we are going to create a service account called `datadog-agent` and give it some permissions to the Kubernetes API through a ClusterRole and a ClusterRoleBinding. You can learn more about RBAC in [the official Kuberentes documentation](https://kubernetes.io/docs/reference/access-authn-authz/rbac/).

Create the service account, the ClusterRole and the ClusterRoleBinding applying the `serviceaccount.yaml` manifest: `kubectl apply -f datadog/serviceaccount.yaml`{{execute}}

Finally, we will deploy the Datadog agent. In the editor, open the file called `datadog-agent.yaml` and explore the different options we have set up for our agent. Can you tell what options set up APM and log collection?

Deploy the Datadog agent DaemonSet applying the `datadog-agent.yaml` manifest: `kubectl apply -f datadog/datadog-agent.yaml`{{execute}}

Wait until the Datadog agent is running before moving to the next step: `kubectl get pods -l app=datadog-agent`{{execute}}