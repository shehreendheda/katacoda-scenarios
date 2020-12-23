#! /usr/bin/env

#while [ ! -f /root/lab-files/docker-compose.yml ]; do sleep 1; done

statuscheck agentrmed

cd /root/lab-files

cat > apikey.env <<EOL
---
DD_API_KEY=${DD_API_KEY}
EOL

docker-compose up