#!/bin/bash

free -h > ~/backups/freemem/free_mem.txt

du -h > ~/backups/diskuse/disk_usage.txt

lsof /dev/null > ~/backups/openlist/open_list.txt

df -h > ~/backups/freedisk/free_disk.txt
