
**Agent**

1. Click the follow to add the environment variables. 
<p><pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add agent env variables">
      - DD_APM_ENABLED=true
      - DD_LOGS_ENABLED=true
      - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true</pre>
<p>Descriptions...
2. here is some text...


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add agent trace port">
    ports:
      - "8126:8126"</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add agent log labels">
    labels:
      - com.datadoghq.ad.logs: '[{"source": "datadog-agent", "service": "agent"}]'</pre>


**Store-frontend**

<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add frontend env variables">
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add frontend log labels">
    labels:
      - com.datadoghq.ad.logs: '[{"source": "ruby", "service": "store-frontend"}]'</pre>


**Discounts**

<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add discounts env variables">
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add discounts flask server command">
    command: ddtrace-run flask run --port=5001 --host=0.0.0.0</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add discounts log labels">
    labels:
      - com.datadoghq.ad.logs: '[{"source": "python", "service": "discounts-service"}]'</pre>


**Ads**

<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add ads env variables">
      - DATADOG_TRACE_AGENT_HOSTNAME=agent
      - DD_LOGS_INJECTION=true
      - DD_ANALYTICS_ENABLED=true</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add ads flask server command">
    command: ddtrace-run flask run --port=5002 --host=0.0.0.0</pre>


<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add ads log labels">
    labels:
      - com.datadoghq.ad.logs: '[{"source": "python", "service": "advertisements-service"}]'</pre>


---

<pre class="file" data-filename="test.txt">test2</pre>

<pre class="file" data-filename="test.txt" data-target="prepend">test1</pre>

<pre class="file" data-filename="test.txt" data-target="append">test3</pre>

<pre class="file" data-filename="test.txt" data-target="insert" data-marker="test3">test4</pre>

---

`mkdir /app-files`{{execute}}

`git clone https://github.com/burningion/ecommerce-observability /app-files`{{execute}}

`cd /app-files`{{execute}}

`git checkout instrumented-fixed`{{execute}}

`docker-compose pull`{{execute}}

`export POSTGRES_USER=postgres`{{execute}}

`export POSTGRES_PASSWORD=postgres`{{execute}}

`docker-compose up -d`{{execute}}