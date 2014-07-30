#### Install Drupal 7 using nginx in Ubuntu 14.04

PHP 5.2 or greater
Nginx 
mysql 5.5

```
Operating system:	Ubuntu 14.04-LTS
IP address :		192.168.1.220
Database Server:	MySQL

Database Name:		drupaldb_web
Database User:		sysadmin
Database pass:		admin123$

Web Document Root:	/var/www
```
 
* Php with following extensions

php5-gd, xml, mbstring

* Update the repository and upgrade the current packages before installation:


```
# sudo apt-get update
# sudo apt-get upgrade
```

* Install Nginx & mysql


```
# sudo apt-get install nginx mysql-server php5-mysql
```

* We can install drupal using drush

```
# sudo apt-get install drush php-console-table
```

* Install the latest version of drush using following command


```
# sudo pear channel-discover pear.drush.org
# sudo pear install drush/drush
```

* After installing updated version check using 

```
# drush version
```

* Install needed dependencies for drupal using:

```
# sudo apt-get install php5-cgi php5-cli php5-common php5-mysql php5-curl php5-dbg php5-gd -y
```

* Here Iam Downloading drupal in my home directory.


```
# cd ~
```

* Download and move the downloaded drupal to default document root

```
# drush dl drupal

# sudo mkdir -p /var/www

# mv ~/drupal-7.30/* /var/www/
```

* Create Database to drupal

```
mysql -u root -p
mysql> CREATE DATABASE drupaldb_web;
mysql> GRANT ALL PRIVILEGES ON drupaldb_web.* TO 'sysadmin'@'localhost' IDENTIFIED BY 'admin123$' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
mysql> \q
```

* Create Directory for files which we used to upload from drupal site admin were need to save, And change the permission www-data:
 
```
# sudo mkdir /var/www/sites/default/files

# sudo chown www-data:www-data /var/www/sites/default/files
```

* Create the settings.php file


```
# sudo cp /var/www/sites/default/default.settings.php /var/www/sites/default/settings.php

# sudo chown www-data:www-data /var/www/sites/default/settings.php
```

* Create Virtualhost for drupal

```
# sudo vim /etc/nginx/sites-available/drupal
```

* Append the following virtualhost entry for drupal
  Note: Here Iam using both ssl and non-ssl site, Replace my.domain.com with your domain name.
 

```
# Redirect all non-encrypted to encrypted

server {
    server_name          mydomain.com;
    listen               *:80;
    return 301 https://mydomain.com$request_uri;
}


# Non-ssl Virtualhost for 80

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /var/www;
        index index.php index.html index.htm;

        server_name mydomain.com;

        location / {
                # try_files $uri $uri/ =404;
                try_files $uri $uri/ /index.php?q=$uri&$args;
        }

        error_page 404 /404.html;

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
                root /usr/share/nginx/html;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include fastcgi_params;
        }
}


# SSL Virtualhost for 443

server {
        listen 443;
        server_name mydomain.com;

        root /var/www;
        index index.php index.html index.htm;

        location / {
                # try_files $uri $uri/ =404;
                try_files $uri $uri/ /index.php?q=$uri&$args;
        }

        error_page 404 /404.html;

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
                root /usr/share/nginx/html;
        }

        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include fastcgi_params;
        }
        ssl on;
        ssl_certificate /etc/ssl/certs/STAR_mydomain.com.crt;
        ssl_certificate_key /etc/ssl/private/mydomain.com.key;
        ssl_protocols SSLv3 TLSv1;
        ssl_ciphers ALL:!aNULL:!ADH:!eNULL:!LOW:!EXP:RC4+RSA:+HIGH:+MEDIUM;
        client_body_in_file_only clean;
        client_body_buffer_size 32K;
        client_max_body_size 25M;
}

```

* Create a soft-link from sites-available to sites-enabled

```
# sudo ln -s /etc/nginx/sites-available/drupal /etc/nginx/sites-enabled/drupal

# Sudo service nginx restart
```

Then follow the Web interface installation steps
