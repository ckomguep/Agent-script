#!/bin/bash

#Description: This script will check the new install server
#Author: Carole
#Date: April 2021

## CPU check
CPU_N=`nproc`
if [ ${CPU_N} -lt 2 ]
then
echo "CPU check FAILED"
else 
echo "CPU check PASS"
fi 

## Memory check
MEM=`free -m |grep Mem | awk '{print $2}'`
if [${MEM}] -lt 2000 ]
then
echo "CPU check FAILED"
else 
echo "CPU check PASS"
fi 

## check files if exist
if [ -f /etc/group ]
then
echo "File /etc/group PASS"
else
echo "File /etc/group FAILED"
fi 

if [ -f /etc/passwd ] 
then 
echo "File /etc/passwd PASS" 
else
echo "File /etc/passwd FAILED" 
fi

if [ -f /etc/httpd ] 
then 
echo "File /etc/httpd PASS" 
else
echo "File /etc/httpd FAILED" 
fi

if [ -f /etc/kubernetes ] 
then 
echo "File /etc/kubernetes PASS" 
else
echo "File /etc/kubernetes FAILED" 
fi

## Check user Puppet
id puppet
RC=$?
if [ ${RC} -eq 0 ]
then 
echo "User puppet check PASS"
else
echo "User puppet check FAILED"
fi

## Kernel Version
kernelVersion=`uname -r | awk -F "." '{print $1}'`

if [ ${kernelVersion} -ge 3 ]
then
echo "Kernel version checked PASS"
else 
echo "Kernel version check FAILED"
fi
