apt-get update
apt-get upgrade
apt-get install default-jre
java -version
apt-get install nginx
systemctl start nginx
systemctl status nginx
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update
apt-get install elasticsearch
vim /etc/elasticsearch/elasticsearch.yml
---------------
network.host: 0.0.0.0
http.cors.enabled: true
http.cors.allow-origin: "*"
----------------
vim /etc/elasticsearch/jvm.options
------------
-Xms128m
-Xmx128m
-----------
systemctl start elasticsearch
systemctl enable elasticsearch
systemctl status elasticsearch
curl -XGET http://localhost:9200
apt-get install kibana
systemctl start kibana
systemctl enable kibana
systemctl status kibana
echo "kibanaadmin:`openssl passwd -apr1`" | tee -a /etc/nginx/htpasswd.users
vim /etc/nginx/sites-available/<public ip>
--------------------
server {
    listen 80;

    server_name <public ip>;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
----------------------
ln -s /etc/nginx/sites-available/<public ip> /etc/nginx/sites-enabled/<public ip>
nginx -t
systemctl restart nginx
ufw allow 'Nginx Full'
scp -i <path to .pem file> <path to sample-movies.bulk file> ubuntu@<dns name>:sample-movies.bulk
curl -XPOST http://localhost:9200/_bulk?pretty --data-binary @sample-movies.bulk -H "Content-Type: application/json"
