There are two issues with the `movies` method in the service.

Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab. 

`time curl http://localhost:8081/movies?q=jurassic >> /dev/null`{{execute T1}}

In the editor on the right, open the main `movies-api-java` server source file by clicking this filename: `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}} (Note: This file may already be open because you updated it earlier.)

#### Issue 1

To improve performance, you first want to make the `moviesEndpoint` method to compile the regular expression once using `Pattern.compile` instead of using `Pattern.matches`, which internally compiles for each movie that is queried.

Scroll to **line 85**. Click the code block below to update the `moviesEndpoint` method to use `Pattern.compile`:

<pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="// Problem: We are not compiling the pattern and there's a more efficient way of ignoring cases.">var p = Pattern.compile(query, Pattern.CASE_INSENSITIVE);</pre>

Scroll to **line 86**. Click the code block below to continue to update the `moviesEndpoint` method to use `Pattern.compile`:

<pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="movies = movies.filter(m -> Pattern.matches(".*" + query.toUpperCase() + ".*", m.title.toUpperCase()));">movies = movies.filter(m -> m.title != null && p.matcher(m.title).find());</pre>

#### Issues 2

Date parsing inside `sortByDescReleaseDate` is really expensive. Since the dates are already in `yyyy-mm-dd` format, they can be sorted as strings without having to be parsed.

Scroll to **line 94**. Click the code block below to use the release dates in its original string format:

<pre class="file" data-filename="dd-continuous-profiler-dash2021/src/main/java/movies/Server.java" data-target="insert" data-marker="try {return LocalDate.parse(m.releaseDate);} catch (Exception e) {return LocalDate.MIN;}">return m.releaseDate;</pre>

With those two changes the performance of that endpoint is now better than the credits endpoint, as expected.