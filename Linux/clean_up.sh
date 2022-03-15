#!/bin/bash
apt clean -y 

rm /tmp/*
rm /var/tmp/*

rm -rfv /home/sysadmin/.cache/thumbnails
rm -rfv /home/sysadmin/.cache/thumbnails
rm -rfv /home/instructor/.cache/thumbnails
rm -rfv /home/student/.cache/thumbnails
rm -rfv /root/.cache/thumbnails

