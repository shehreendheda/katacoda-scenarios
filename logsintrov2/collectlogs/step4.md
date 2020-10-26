2. Press CTRL-C in the **Terminal** to stop docker-compose. Then add the following label to the redis block in your docker-compose.yml file:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert redis labels here">
       labels:
         com.datadoghq.ad.logs: '[{"source": "redis", "service": "redis"}]'</pre>

3. Add the following label to the nginx block in the same file:

    <pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# insert nginx labels here">
         com.datadoghq.ad.logs: '[{"source": "nginx", "service": "nginx"}]'</pre>
