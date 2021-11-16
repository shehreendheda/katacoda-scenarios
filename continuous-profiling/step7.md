Let's try a heavier task: getting movie credits, for all movies with the word _The_ in their title.

1. Run `curl` to query for this information:

  `time curl http://localhost:8081/credits?q=the >> /dev/null`{{execute T1}}

2. Observe that this request is very slow, even after we include the improvement from the previous step:

  ```
  real    0m6.179s
  user    0m0.011s
  sys     0m0.011s
  ```

3. **Presented Live**: _Let's analyze this slow request using the Continuous Profiler._

---

Proceed to the next step to fix this performance issue on `movies-api-java`.
