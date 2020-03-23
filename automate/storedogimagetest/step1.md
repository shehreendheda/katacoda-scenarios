test environment

**branch**
```
mkdir /app-files
git clone https://github.com/burningion/ecommerce-observability /app-files
cd /app-files
git checkout instrumented-fixed
docker-compose pull
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker-compose up -d
```{{execute}}



**commit**
```
mkdir /app-files
git clone https://github.com/burningion/ecommerce-observability /app-files
cd /app-files
git checkout e87fb337a9990fdf9c979ff4a2dafae701204c8b
docker-compose pull
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker-compose up -d
```{{execute}}