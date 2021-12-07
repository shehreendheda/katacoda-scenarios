There are two issues with the `movies` method in the service.

Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab. 

`time curl http://localhost:8081/movies?q=jurassic >> /dev/null`{{execute T1}}

Notice that the query runs slowly.

In Datadog, use APM Traces and Continuous Profiling to investigate the slow performance.

In the editor on the right, open the main `movies-api-java` server source file by clicking this filename: `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}} (Note: This file may already be open because you updated it earlier.)

#### Issue 1

To improve performance, you first want to make the `moviesEndpoint` method to compile the regular expression once using `Pattern.compile` instead of using `Pattern.matches`, which internally compiles for each movie that is queried.

Scroll to **line 85**. Manually replace **lines 85-86** with the following:

```
var p = Pattern.compile(query, Pattern.CASE_INSENSITIVE);
movies = movies.filter(m -> m.title != null && p.matcher(m.title).find());
```{{copy}}

The `moviesEndpoint` method now looks like:

```
private static Object moviesEndpoint(Request req, Response res) {
    var movies = MOVIES.get().stream();
    movies = sortByDescReleaseDate(movies);
    var query = req.queryParamOrDefault("q", req.queryParams("query"));
    if (query != null) {
        var p = Pattern.compile(query, Pattern.CASE_INSENSITIVE);
        movies = movies.filter(m -> m.title != null && p.matcher(m.title).find());
    }
    return replyJSON(res, movies);
}
```

#### Issues 2

Date parsing inside `sortByDescReleaseDate` is really expensive. Since the dates are already in `yyyy-mm-dd` format, they can be sorted as strings without having to be parsed.

Scroll to **line 93**. Manually replace **lines 93-98** with `return m.releaseDate;`{{copy}}, so that the `sortByDescReleaseDate` method look like this:

```
private static Stream<Movie> sortByDescReleaseDate(Stream<Movie> movies) {
	return movies.sorted(Comparator.comparing((Movie m) -> {
		return m.releaseDate;
	}).reversed());
}
```


Re-run the application by clicking this command to restart the service: `cd /root/lab/dd-continuous-profiler-dash2021 && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

Click the `curl` command below to rerun the query, or copy, paste, and run the command in the **Terminal** tab. 

`time curl http://localhost:8081/movies?q=jurassic >> /dev/null`{{execute T1}}

Notice that the performance of the query has now improved.