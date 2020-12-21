#!/bin/bash

docker kill datadog-agent

statusupdate agentkilled

while true
do
	curl -X GET 'http://localhost:8080/think/?subject=technology'
    sleep 5
    curl -X GET 'http://localhost:8080/think/?subject=religion'
    sleep 5
    curl -X GET 'http://localhost:8080/think/?subject=war'
    sleep 5
    curl -X GET 'http://localhost:8080/think/?subject=work'
    sleep 5
    curl -X GET 'http://localhost:8080/think/?subject=music'
    sleep 5
done