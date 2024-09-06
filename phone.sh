#!/bin/env bash

PHONE=192.168.1.112
PORT=$( nmap -sT ${PHONE} -p32000-49999 | awk -F/ '/tcp open/{print $1}' )

echo "Ports $PORT"

for port in $PORT
do
    adb disconnect
    adb connect ${PHONE}:${port}
    scrcpy -s ${PHONE} -S --no-audio
done
