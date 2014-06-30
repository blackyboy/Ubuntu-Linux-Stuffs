#### Apache web server Harderning

* Add a User for apache

```
# useradd -d /var/www -s /sbin/nologin web-sites
```

* Edit the configuration file

```
# vim /etc/httpd/conf/httpd.conf
```

* Change the user and Group to newly created user and Group

```
# User web-hoster
# Group web-hoster
```

* Restart the Service 

```
# /etc/init.d/httpd restart
```

* Confirmation after change 

```
ps -ef | grep -i http | awk '{print $1}'
```

* Disable Apache and server Information's


```
# ServerTokens Prod
```

* Disable Apache Signature 


```
# ServerSignature off
```

* Disable Directory listing


```
<Directory /var/www/html>
  Options -Indexes
  Order allow,deny
  Allow from all
</Directory>
```


Or we can replace with the below too


```
<Directory /var/www/html>
  Options None
  Order allow,deny
  Allow from all
</Directory>
```

* Disable root Directory access Using Allow and Deny.


```
<Directory />
    Options None
    Order deny,allow
    Deny from all
</Directory>
```

* Disable the Modules which all not in Use.
  To list the module use command httpd -l


* Add Administrator group for apache
  Here we using web-admin for the group name


```
# groupadd web-admins
```

Then change the httpd.conf group to web-admins


```
chown -R root:web-admins /etc/httpd/conf/httpd.conf
chmod -R 770 /etc/httpd/conf/httpd.conf
```

* Then add the administrators to the web-admins Group


```
# usermod -a -G web-admins web-administrator
# usermod -a -G web-admins  web-engg
```

