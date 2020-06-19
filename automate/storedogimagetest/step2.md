

<pre class="file" data-filename="docker-compose.yml" data-target="insert" data-marker="# add agent env variables">
```
      - DD_APM_ENABLED=true
      - DD_LOGS_ENABLED=true
      - DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
```</pre>

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