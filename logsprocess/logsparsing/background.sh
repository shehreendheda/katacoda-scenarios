#!/bin/bash

until $(curl -o /dev/null -s -I -f http://localhost:8080)
do
    sleep 5
done

while true
do
	`curl -X GET 'http://localhost:8080/think/?subject=technology'`
    sleep 5
    `curl -X GET 'http://localhost:8080/think/?subject=religion'`
    sleep 5
    `curl -X GET 'http://localhost:8080/think/?subject=war'`
    sleep 5
    `curl -X GET 'http://localhost:8080/think/?subject=work'`
    sleep 5
    `curl -X GET 'http://localhost:8080/think/?subject=music'`
    sleep 5
done