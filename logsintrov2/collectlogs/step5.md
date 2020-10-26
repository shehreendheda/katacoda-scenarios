1. Add the following labels to the docker-compose.yml file for the api and thinker containers:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert api labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-api"}]'</pre>

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert thinker labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "webapp", "service": "thinker-microservice"}]'</pre>