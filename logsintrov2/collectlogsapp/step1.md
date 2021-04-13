In the terminal on the right, the environment is being prepared. When you will see a message `Provisioning Complete` along with some login credentials when the environment is prepared.

1. When files appear in the editor directory on the right, click `deploy/docker-compose/docker-compose-no-logs.yml`{{open}} to view the file in the editor. 

     This docker-compose file instruments the Datadog agent and app services for monitoring with Datadog. 
     
     All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

     Because the application is run in a Docker (containerized) environment, the Datadog Agent runs in a container alongside the application containers: `agent`. 
     
     Each application service runs in its own Docker container: `discounts`, `frontend`, `advertisements`, and `db`.

     Metric and trace collection has been configured, but log collection is not yet configured.

Let's configure log collection for the app services.