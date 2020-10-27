### Optional

From Datadog Agent 6.8+, the `source` and `service` default to the `short_image` tag value for log sources with integrations, which is why `redis` and `nginx` had pre-assigned `source` and `service` tags when their integrations were automatically enabled. If custom log collection configurations are provided for these sources, Datadog automatically installs the corresponding integration based on the log source listed in the configuration and overrides any defaults values for parameters based on the configurations.

Let's also update the add labels for the nginx and redis that override either the default `source` or `service` value to see how this affects the log

3. Click **Copy to Editor** to configure the log `source` and `service` tags for the `redis` and `nginx` containers.

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert redis labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "redis", "service": "redis"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert nginx labels here">
         com.datadoghq.ad.logs: '[{"source": "my-nginx", "service": "nginx"}]'</pre>



