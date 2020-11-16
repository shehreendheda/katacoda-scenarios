#!/bin/bash

while true
do
	`curl -X GET 'http://localhost:8080/think/?subject=technology'`
    `curl -X GET 'http://localhost:8080/think/?subject=religion'`
    `curl -X GET 'http://localhost:8080/think/?subject=war'`
    `curl -X GET 'http://localhost:8080/think/?subject=work'`
    `curl -X GET 'http://localhost:8080/think/?subject=music'`
done