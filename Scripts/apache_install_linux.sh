#!/bin/bash 
#install apache 
yum install httpd -y 
#start 
systemctl start httpd 
#os level service
systemctl enable httpd 
#check status
systemctl status httpd