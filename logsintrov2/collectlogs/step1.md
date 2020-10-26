In the terminal on the right, the environment is being prepared. This may take up to 3 minutes. 

The Flask application supported by NGINX, Redis, an API, and a thinker microservice is being brought online using a docker-compose.yml. The application is also being configured for data collection with the Datadog Agent.

Click `docker-compose.yml`{{open}} to view its details.

All <a href="https://docs.datadoghq.com/agent/docker/?tab=standard" target="_datadog">configuration in a Docker environment</a> is done through environment variables, volumes, and Docker labels.

Each application service runs in its own Docker container: `api`, `thinker`, `nginx`, and `regis`.

Because the application is run in a Docker (containerized) environment, the Datadog Agent also runs in a container alongside the other containers: `datadog`. 

Metric and trace collection has been configured, but log collection is not yet configured.

You will configure log collection in the following steps.

When the output in the terminal looks like the following image, the environment is ready to go and you can continue.

![env-online](collectlogs/assets/env-online.png)