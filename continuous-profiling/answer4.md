There are two issues with the `movies` method in the service.

Click the `curl` command below to query for this information, or copy, paste, and run the command in the **Terminal** tab. 

`time curl http://localhost:8081/movies?q=jurassic >> /dev/null`{{execute T1}}

In the editor on the right, open the main `movies-api-java` server source file by clicking this filename: `dd-continuous-profiler-dash2021/src/main/java/movies/Server.java`{{open}} (Note: This file may already be open because you updated it earlier.)

#### Issue 1

You first want to make the moviesEndpoint compile the regular expression once using `Pattern.compile` instead of using `Pattern.matches`, which internally compiles the  again for every single movie:
Instead of
java
	private static Object moviesEndpoint(Request req, Response res) {
		var movies = MOVIES.get().stream();
		movies = sortByDescReleaseDate(movies);
		var query = req.queryParamOrDefault("q", req.queryParams("query"));
		if (query != null) {
			// Problem: We are not compiling the pattern and there's a more efficient way of ignoring cases.
			movies = movies.filter(m -> Pattern.matches(".*" + query.toUpperCase() + ".*", m.title.toUpperCase()));
		}
		return replyJSON(res, movies);
	}
change it to
java
	private static Object moviesEndpoint(Request req, Response res) {
		var movies = MOVIES.get().stream();
		movies = sortByDescReleaseDate(movies);
		var query = req.queryParamOrDefault("q", req.queryParams("query"));
		if (query != null) {
			var p = Pattern.compile(query, Pattern.CASE_INSENSITIVE); // ⬅⬅⬅⬅⬅
			movies = movies.filter(m -> m.title != null && p.matcher(m.title).find()); // ⬅⬅⬅⬅⬅
		}
		return replyJSON(res, movies);
	}
ii. The second part is that date parsing inside sortByDescReleaseDate is really expensive. One possible solution is to observe that the dates are already in yyyy-mm-dd format, which means we can sort them as strings, without parsing, with that method becoming
java
	private static Stream<Movie> sortByDescReleaseDate(Stream<Movie> movies) {
		return movies.sorted(Comparator.comparing((Movie m) -> {
			return m.releaseDate;
		}).reversed());
	}
With those two changes the performance of that endpoint is now better than the credits endpoint, as expected.