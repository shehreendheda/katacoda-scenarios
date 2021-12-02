You previously requested the movie credits for all movies with _Jurassic_ in their name. This retrieved credits for eight movies. You now try to request movie credits for all movies with the word _The_ in their title, which will return a significantly greater number of results.

1. Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab. 

  `time curl http://localhost:8081/credits?q=the >> /dev/null`{{execute T1}}

  In the terminal, you observe that this endpoint performs quite slowly when retrieving a significantly greater number of results. For example, you may see a result like the one below:

  ```
  real    0m19.524s
  user    0m0.011s
  sys     0m0.011s
  ```

  Repeat this step two or three more times to generate multiple traces.

2. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  Make sure the list is still filtered to `env:staging`{{copy}} and `service:movies-api-java`{{copy}}.

  Click one of the `movies-api-java` traces that appeared at the top of the list. This trace corresponds to the request you made to the service in the earlier step.

  Notice that the top span corresponding to the `movies-api-java` service has no child spans. The APM trace provides no further visibility into the underlying processes that can explain why the service performed slowly to retrieve the result. 

3.  Scroll below the flame graph and click the tab labeled **Code Hotspots** to see the highlights for profiling data scoped on the selected span, trace, or full profile (the data to 60 seconds of the whole service process). Code Hotspots identification is enabled by default when you turn on profiling for your service. 

  On the left side under the tab, you'll see a list of **Execution Time By Profile Type** for the span. (The list of types varies based on the runtime and language. To learn more about the various types you can view the <a href="https://docs.datadoghq.com/tracing/profiler/connect_traces_and_profiles/#link-from-a-span-to-profiling-data" target="_blank">Link from a span to profiling data</a> documentation.) 
  
  Select **CPU Time** from the list to see a list of **Methods that used the most CPU Time** on the right. Notice that `ReferencePipeline$2$1.accept(Object)` is the method at the top. Scroll the to see the list of stacktraces. You want to look that the profile in more detail to understand what this method is. 

4. Click **View CPU Profile** above the list of the methods. A new broswer tab will open to the **Performance** tab in the **Continuous Profiler**. You see the profiler flame graph for the selected span.

  Browse the page to see the different options in the UI. Leave the **Type** selection as `CPU Time`. You can also leave the **View profile filtered by** as `Span & Children` because this span has no child spans. If the span had child spans, you may have filtered by `Span only`. 

  On the left, notice the options for `Method` is selected. Click through the menu for `Method`, `Package`, and `Thread` to see the breakdown of how the CPU Time is spent for these options. Notice that the `Movies` package uses the greatest CPU Time.

  With `Method` selected on the right, click `Options` above the flame graph. Select `Line Numbers` under **Separate flamegraph by**. Notice that `Line` is now listed as the selected option (instead of `Method`.) Also, notice that line numbers have appeared next to the method names in the spans of the flame graph.

5. On the right, select the Line with the greatest CPU Time, `Server$$Lambda$142...`, to start narrowing down on the source of the delay in the service. 

  You see the there are wide spans, which means that most of the time is being spent exactly on this one stack. You specifically want to find the beginning of the movie server code. 

  Above the flame graph, type `movies` into the **Filter flamegraph by method or package** field to filter by the `Movies` package. Notice that only spans that are associated with this package are highlighted.

  The top highlighted span is now the `Server.creditsEndpoint`. This is where the user request actually comes into our code. The unhighlighted code is framework and web server code. The next span is the `Server.replyJSON`, which is called by this credits endpoint. There is more java code that is run, followed by the `Server.lambda$creditsEndpoint` method, which ultimately calls the `Server.creditsForMovie` method that you had updated earlier. 

  Hover over the `Server.creditsForMovie` span. Notice that a large percentage over 90% (this percentage will vary based on the specific profile) that is spent on this method. The spans below this span are for methods from the Java standard library, which are optimized, so you investigate line #76 because this is a custom method you created and can potentially optimize.

6. You check the source file again to understand why this method performs slowly.

  In the editor on the right, open the main `movies-api-java` server source file by clicking this filename: `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}} (Note: This file may already be open because you updated it earlier.)
  
  Scroll to **Line 76** to view the code for the `creditsForMovie` method. The method retrieves all the credits data, turns them into a stream, filters the stream, and finds the credits that match for the title of one movie. This endpoint is very slow because there are thousands of movies with "the" in the title, so this method is getting called thousands of times to find the credits for all movies with "the" in the name. You want to optimize this method so that it gets called only one time. 

7. There are different ways to optimize this method. One way is to optimize the method is to create a data structure that is a (hash) map that stores a direct list of mappings between the movie.id and the matching movie credits, and then have the method use this map to look up all the requested credits. A map is a key-value mapping. Every key is mapped to exactly one value, and the key is used to retrieve the corresponding value from the map. Right now, the time complexity of finding the movie credits in the list is *O(n)*. The advantage of a (hash) map is that the time complexity to insert and retrieve a value is *O(1)* on average, which will improve performance of the method.

  Scroll to **Line 37**. You can add the a new `CREDITS_BY_MOVIE_ID` map here. Click the code block below to add map on **line 37**:

  <pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="// Placeholder for future improvement">
private static final Supplier&lt;Map&lt;String, List&lt;Credit&gt;&gt;&gt; CREDITS_BY_MOVIE_ID = Suppliers.memoize(() -> CREDITS.get().stream().collect(Collectors.groupingBy(c -> c.id)));
  </pre>

  Scroll to **line 77** (which **line 76**). Click the code block below to update the `creditsForMovie` method to use this map:

  <pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="CREDITS.get().stream().filter(c -> c.id.equals(movie.id)).collect(Collectors.toList())">CREDITS_BY_MOVIE_ID.get().get(movie.id)</pre>

8. Re-run the application by clicking this command to restart the service: `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

9. Click the `curl` command below to rerun the query above, or copy, paste, and run the command in the **Terminal** tab:

  `time curl http://localhost:8081/credits?q=the >> /dev/null`{{execute T1}}

  Notice that the performance of the endpoint, as measured using `time`, has now improved.

  Repeat this step two or three more times to generate multiple traces.

10. Navigate to <a href="https://app.datadoghq.com/apm/traces" target="_datadog">**APM** > **Traces**</a> to view the traces list.

  Make sure the list is still filtered to `env:staging`{{copy}} and `service:movies-api-java`{{copy}}.

  Click one of the new `movies-api-java` traces that appeared in the list after you reran the query. 

  Click the **Code Hotspots** tab below. Notice that the CPU Time spent has reduced noticably because performance has improved.

---

This marks the end of the guided journey to `movies-api-java`.

**Optional side quest**: The movies endpoint (e.g. `http://localhost:8081/movies?q=jurassic`) also has a few performance problems. Can you spot them? (Note: You can click **Solutions** below to see the answers.)
