#!/usr/bin/env bash
until [ -f /usr/local/bin/statusupdate ]
do
     echo "foreground waiting 5 seconds for statuspdate to be installed" | wall -n
     sleep 5
done
statuscheck complete
echo "building"
prepenvironment