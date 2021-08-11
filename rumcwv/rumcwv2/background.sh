#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mv /root/docker-compose.yml /ecommworkshop/deploy/docker-compose

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

# Fetch discounts in the browser
mv /root/home_controller.rb /ecommworkshop/store-frontend-instrumented-fixed/app/controllers/spree/home_controller.rb
mv /root/spree_application.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb
mv /root/index.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/home/index.html.erb

mv /root/discounts-requirements.txt /ecommworkshop/discounts-service/requirements.txt
mv /root/discounts.py /ecommworkshop/discounts-service/discounts.py
ln -s /ecommworkshop/discounts-service/discounts.py /root/lab/discounts.py

mv /root/ads-requirements.txt /ecommworkshop/ads-service/requirements.txt
mv /root/ads.py /ecommworkshop/ads-service/ads.py
ln -s /ecommworkshop/ads-service/ads.py /root/lab/ads.py

docker-compose -f /ecommworkshop/docker-compose.yml pull

statusupdate environment