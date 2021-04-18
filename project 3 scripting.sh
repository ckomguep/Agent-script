#!/bin/bash

#Description: delete logs 14 days old from /var/log 
#Author: Carole
#Date: April 2021

find /var/log -mtime +14 -type f -delete
exit 0