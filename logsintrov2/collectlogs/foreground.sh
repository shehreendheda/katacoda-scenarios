# docker pull datadog/agent:6.11.1
# docker pull redis:5.0.5
# docker pull nginx:1.16.0

git clone https://github.com/DataDog/TrainingEnvironment.git
cp -r TrainingEnvironment/logsintro/* lab-files
rm -rf TrainingEnvironment
cd /root/lab-files

cat > apikey.env <<EOL
---
DD_API_KEY=${DD_API_KEY}
EOL

sed -i '12 i \ \ \ \ \ \ - DD_API_KEY' docker-compose.yml 
sed -i '12 i \ \ \ \ \ \ - DD_LOGS_ENABLED=true' docker-compose.yml 

sed -i 's|datadog/agent:latest|datadog/agent:6.11.1|' docker-compose.yml
sed -i 's|redis:latest|redis:5.0.5|' docker-compose.yml
sed -i 's|nginx:latest|nginx:1.16.0|' docker-compose.yml

# Insert placeholders for Katacoda IDE
sed -i '/DD_PROCESS_AGENT_ENABLED.*/a # insert environment variables here' docker-compose.yml
sed -i '/\/etc\/passwd:ro.*/a # insert volume here' docker-compose.yml
sed -i '\|\./conf\.d/redis/redis\.conf:/usr/local/etc/redis/redis\.conf.*|a # insert redis labels here' docker-compose.yml
sed -i '\|com\.datadoghq\.ad\.instances.*|a # insert nginx labels here' docker-compose.yml
sed -i '/- thinker.*/a # insert api labels here' docker-compose.yml
sed -i '/- "5001:8000".*/a # insert thinker labels here' docker-compose.yml

docker-compose up