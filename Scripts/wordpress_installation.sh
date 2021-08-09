apt update
apt upgrade
apt install apache2 -y
systemctl start apache2
systemctl status apache2
systemctl enable apache2
apt install php php-mysql -y
apt install mysql-server -y
systemctl start mysql
systemctl enable mysql
mysql_secure_installation
mysql -u root -p
show databases;
create database wordpress;
show databases;
create user "user_name"@"%" identified by "password";
grant all privileges on database_name.* to "database_user_name"
flush privileges;
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cd wordpress
cp wp-config-sample.php wp-config.php
cd . /var/www/html/
