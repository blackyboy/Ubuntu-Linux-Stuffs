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

* Disable Apache and server Informations


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
# usermod -a -G web-admins web-engg
```

* Disable Other options such like ExecCGI


```
<Directory/>
  Options -Include -ExecCGI
  AllowOverride None
  Order allow,deny
  Allow from all
</Directory>
```

* Restrict Access to Specific IP Address or Network


```
<VirtualHost 192.168.1.100:80>
    ServerAdmin blackyboy@masterdns.local.lan
    DocumentRoot /var/www/html
    ServerName masterdns.local.lan
<Directory /var/www/html/office>
    Order deny,allow
    Deny from all
    Allow from 192.168.1.0/255.255.255.0
</Directory>
<Directory /var/www/html/accounts>
    Order deny,allow
    Deny from all
    Allow from 192.168.1.10
</Directory>
    ErrorLog logs/masterdns.local.lan-error_log
    CustomLog logs/masterdns.local.lan-access_log common
</VirtualHost>
```


* Add a SSL Certiificate for Web server


```
<VirtualHost 192.168.1.100:80>
    ServerAdmin blackyboy@dnsmaster.lan
    DocumentRoot /var/www/html
    ServerName masterdns.local.lan
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/masterdns.local.lan.crt
    SSLCertificateKeyFile /etc/pki/tls/masterdns.local.lan.key
    SSLCertificateChainFile /etc/pki/tls/certs/masterdns.local.lan-bundle.crt
    ErrorLog logs/masterdns.local.lan-error_log
    CustomLog logs/masterdns.local.lan-access_log common
</VirtualHost>
```

