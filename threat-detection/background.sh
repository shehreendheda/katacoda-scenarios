#!/usr/bin/env bash
echo "setting up the environment. This takes a few minutes. Please wait. We will let you know when it's ready." | wall -n
# script below is from this url
curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash
### start script
#!/usr/bin/env bash
#rm /usr/local/bin/prepenvironment
#if [ $(dpkg-query -W -f='${Status}' unzip 2>/dev/null | grep -c "ok installed") -eq 0 ];
#then
#  echo "running apt get update" | wall -n
#  apt-get update
#  apt-get install unzip;
#fi

#echo "download and installing katacoda scripts" | wall -n
#wget --no-check-certificate --quiet -P /tmp/kchelpers https://datadoghq.dev/katacodalabtools/release.zip
#cd /tmp/kchelpers
#unzip -qq release.zip
#cd scripts

#shopt -s globstar
#for file in * ; do
#    chmod +x "$file"
#    cp "$file" /usr/local/bin
#done
#cd
#rm -rf /tmp/kchelpers
#echo "Installed KCHelpers" >> /root/status.txt
#echo "done running scripts" | wall -n
### end script

# Wait for required assets to appear in the filesystem
until  [ -f /root/lab/docker-compose.yml ]
do
  sleep 2
done


# import env vars
source /root/.kcrc

echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

apt update && apt install -y python3.8-dev

echo "enabling security monitoring" | wall -n
curl -X PUT "https://api.datadoghq.com/api/v1/security_analytics/security_monitoring/activation" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}"

cd /root/lab
#echo "cloning security-workshop" | wall -n
#git clone https://github.com/jmassey-datadog/security-workshop-2.git security-workshop
#cd /workspace/security-workshop

echo "we are setting up terraform" | wall -n
cd /tmp/
wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip
unzip terraform_1.0.9_linux_amd64.zip
mv terraform /usr/local/sbin


if [[ -z "${DD_API_KEY}" ]]; then
  echo "DD_API_KEY not set"  | wall -n
else
    echo "we are spinning up your automated script generator" | wall -n
    cd /root/lab
    docker-compose up -d
    echo "the following are the running containers" | wall -n
    docker ps | wall -n
    cd /root/lab/datadog-terraform
    echo "we are setting up your datadog account" | wall -n
    export TF_VAR_DD_API_KEY=$DD_API_KEY
    export TF_VAR_DD_APP_KEY=$DD_APP_KEY
    terraform init
    terraform apply -auto-approve
fi
statusupdate complete