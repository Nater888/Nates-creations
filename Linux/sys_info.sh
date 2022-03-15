#!/bin/bash

echo 'instert title here' && date
echo '$user' 
curl ifconfig.me
echo '$HOSTNAME'
grep "nameserver" /etc/resolv.conf
free -h | head-n '5'
 cat /proc/cpuinfo | head -n '6'
df -H
w
