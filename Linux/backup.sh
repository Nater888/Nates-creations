#!/bin/bash

mkdir -p /var/backup
tar cvzf /var/backup/home.tar.gz /home
mv /var/backup/home.tar /var/backup/home.20220106.tar.gz
tar cvzf /var/backup/system.tar.gz /home
ls -lah /var/backup >> /var/backup/file_report.txt
free -h >> /var/backup/memory_report.txt


