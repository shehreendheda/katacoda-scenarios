
`mkdir /create-slo`{{execute}}

`git clone https://github.com/burningion/ecommerce-observability /create-slo`{{execute}}

`cd /create-slo`{{execute}}

`git checkout instrumented-fixed`{{execute}}

`docker-compose pull`{{execute}}

`export POSTGRES_USER=postgres`{{execute}}

`export POSTGRES_PASSWORD=postgres`{{execute}}

`docker-compose up -d`{{execute}}