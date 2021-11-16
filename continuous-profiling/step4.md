Let's follow along the getting started instructions from the <a href="https://app.datadoghq.com/apm/docs?architecture=container-based&collection=Same%20host&environment=docker&language=java" target="_datadog">APM Getting started page</a>:

* Step 1: Choose your Environment and Application Language. We pick **Docker** ➡ **Same host** → **Java**

* Step 2: Run the Agent.
  We can run the Datadog agent using the following snippet (which already includes the API key shown in the `creds`{{execute T1}}):
  ```
  docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /proc/:/host/proc/:ro \
    -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
    -p 127.0.0.1:8126:8126/tcp \
    -e DD_API_KEY=$DD_API_KEY \
    datadog/agent:latest
  ```{{execute T1}}
  💡 Tip: We can check if the agent is healthy using:

  ``docker exec -it `docker ps --filter "expose=8126" -q` agent status``{{execute T1}}

* Step 3: Install the Java client.

  `wget -O dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'`{{execute T1}}

* Step 4: Instrument your application.
  To do so, we will set the Service name to `movies-api-java`, the Environment name to `staging`, and enable all three of

  - ✅_Automatically Inject Trace and Span IDs into Logs_
  - ✅_Tracing Without Limits_
  - ✅_Continuous Profiling_

  We're now ready to apply the resulting configuration snippet to `movies-api-java`.

* Step 4.1: Open the Gradle build file:

  `dd-continuous-profiler-dash2021/build.gradle`{{open}}

* Step 4.2: Add the provided arguments as `applicationDefaultJvmArgs` (`build.gradle`, line 25):

<pre class="file" data-filename="dd-continuous-profiler-dash2021/build.gradle" data-target="insert" data-marker="    applicationDefaultJvmArgs = ['-Xmx3g', '-Xms3g']">
     applicationDefaultJvmArgs = [
         '-Xmx3g',
         '-Xms3g',
         '-javaagent:dd-java-agent.jar',
         '-Ddd.profiling.enabled=true',
         '-XX:FlightRecorderOptions=stackdepth=256',
         '-Ddd.logs.injection=true',
         '-Ddd.trace.sample.rate=1',
         '-Ddd.service=movies-api-java',
         '-Ddd.env=staging',
         "-Ddd.version=${new Date().toString()}", // Tag each run with a different version
         '-Ddd.profiling.jfr-template-override-file=dd-profiler-overrides.jfp',
     ]</pre>

---

After running through the steps, we're ready to re-run our application using:

   `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

You should see a `DATADOG TRACER CONFIGURATION` log message that confirms that the application is now collecting data.

---

Proceed to the next step to continue analyzing `movies-api-java`.
