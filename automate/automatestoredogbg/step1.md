test environment

**branch**
```
mkdir /create-slo
git clone https://github.com/burningion/ecommerce-observability /create-slo
cd /create-slo
git checkout instrumented-fixed
docker-compose pull
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker-compose up -d

```{{execute}}


**commit**
```
mkdir /create-slo
git clone https://github.com/burningion/ecommerce-observability /create-slo
cd /create-slo
git checkout e87fb337a9990fdf9c979ff4a2dafae701204c8b
docker-compose pull
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker-compose up -d
```{{execute}}