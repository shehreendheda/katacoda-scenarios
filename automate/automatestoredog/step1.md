automating storedog app

```
until $(curl -o /dev/null -s -I -f http://localhost:3000); do
    printf '.'
    sleep 5
done
printf '\n\nThe app is instrumented!\n\n'
```{{execute}}

`break-app`{{execute}}