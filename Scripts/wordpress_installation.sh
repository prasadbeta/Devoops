#!/bin/bash
#update the repository
apt update
#upgrade the repository
apt upgrade
#install the apache server
apt install apache2 -y
#start the apache server
systemctl start apache2
#check the status of apache server
systemctl status apache2
#enable the apache server
systemctl enable apache2
#install the php php-my-sql
apt install php php-mysql -y
#install the mysql server
apt install mysql-server -y
#start the mysql server
systemctl start mysql
#enable the mysql server
systemctl enable mysql
#secure the mysql
mysql_secure_installation
#login the mysql server
mysql -u root -p
#display the databases
show databases;
#create the database
create database wordpress;
#display the databases
show databases;
#create user and password
create user "user_name"@"%" identified by "password";
#give permissions database to user
grant all privileges on database_name.* to "database_user_name"
#refresh the databases
flush privileges;
#download the wordpress file
wget https://wordpress.org/latest.tar.gz
#extract the file
tar -xzf latest.tar.gz
#change the direcory
cd wordpress
#copy the file current directory
cp wp-config-sample.php wp-config.php
#copy the files into web_path
cp . /var/www/html/
