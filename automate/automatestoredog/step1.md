automating storedog app

```
until $(curl --output /dev/null --silent --head --fail http://localhost:3000); do
    printf '.'
    sleep 5
done
printf '\n\nThe app is instrumented!\n\n'
```{{execute}}