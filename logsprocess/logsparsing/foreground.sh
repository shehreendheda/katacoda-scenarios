#!/bin/bash

statuscheck tools

# Write API key for background.sh
echo $DD_API_KEY > /root/.dd_api_key 
statusupdate apikey
clear

prepenvironment