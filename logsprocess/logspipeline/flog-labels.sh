#! /usr/bin/env

docker kill flog

docker run --name flog -d --label com.datadoghq.ad.logs='[{"source": "apache", "service": "apache"}]' -it --rm mingrammer/flog -f apache_combined -l -n 100000 -d 0.2