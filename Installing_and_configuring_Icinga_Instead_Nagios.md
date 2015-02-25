#### Installing and configuring Icinga

* To install Icinga we have to add the repository first

```
# sudo add-apt-repository ppa:formorer/icinga
```

Update the repo cache

```
# sudo apt update
```

#### Install the Icinga package


```
# sudo apt install icinga icinga-doc icinga-idoutils mysql-server libdbd-mysql mysql-client
```

Add the apache user with nagios group


```
# sudo usermod -a -G nagios www-data
```

Edit the icinga configuration and change the IDO2DB=no to yes


```
# sudo vi /etc/default/icinga

IDO2DB=yes
```

Restart icinga to make changes.

```
# sudo service ido2db start
```


Make copy of idomod module


```
# sudo cp /usr/share/doc/icinga-idoutils/examples/idoutils.cfg-sample /etc/icinga/modules/idoutils.cfg
```

Restart the Icinga Service

```
# sudo service icinga restart
```

Access the web UI using 


```
https://mydomain.com/icinga
```

Login using below Credentials.


```
Username	=	icingaadmin
password	=	password
```

May be localhost will be down, we need to change the permission for ping command.


```
# sudo chmod u+s `which ping`
```

#### Client Side configuration:


We need to install client side agents in client machine.

Install the client package using


```
# sudo apt install nagios-plugins nagios-nrpe-server
```

Edit the configuration in nrpe.cfg


```
# sudo vim /etc/nagios/nrpe.cfg
```

Check for below configurations.


```
server_address = local IP address of this client machines.
allowed_hosts  = Here Icinga Server IP.
commands       = check for the command and drive which all need to get monitor.
```

Restart the nagios client service using


```
# sudo service nagios-nrpe-server restart
```

#### Back to icinga Server:

Create a host information using


```
# sudo vim /etc/icinga/objects/mydomain.com.cfg
```

* Add the below configurations to get monitor.


```
## Host ##

define host {
                use                     generic-host
                host_name               name.mydomain.com
                alias                   Learning Arrivuapps Server
                address                 111.111.111.44
                }

## Current User ##

define service {
        use                             generic-service
        host_name                       name.mydomain.com
        service_description             Current Users
        check_command                   check_users!20!50
        }

## Disk Space ##

define service {
        use                             generic-service
        host_name                       name.mydomain.com
        service_description             Disk Space
        check_command                   check_all_disks!20%!10%
        }

## Ping ##

define service {
        use                             generic-service
        host_name                       name.mydomain.com
        service_description             PING
        check_command                   check_ping!100.0,20%!500.0,60%
        }

## SSH ##

define service {
        use                             generic-service
        host_name                       name.mydomain.com
        service_description             SSH
        check_command                   check_ssh
        notifications_enabled           0
        }

## Load ##

define service {
        use                             generic-service
        host_name                       name.mydomain.com
        service_description             Current Load
        check_command                   check_load!5.0!4.0!3.0!10.0!6.0!4.0
        }

```

* Restart the Icinga service 

```
# sudo service icinga restart
```

#### Adding Virtual Host to Icinga.


If we need to access our site without using /icinga we can assign a virtualhost


* Create a virtualhost under /etc/apache2/site-available/
* Enable SSL moduel and Rewrite.

Append the virtualhost entry to newly creating file.


```
<VirtualHost *:80>
  ServerName monitor.mydomain.com
  ServerAdmin admin@mydomain.com
  DocumentRoot /usr/share/icinga/htdocs
  ScriptAlias /cgi-bin/icinga /usr/lib/cgi-bin/icinga
  ScriptAlias /icinga/cgi-bin /usr/lib/cgi-bin/icinga
  Alias /icinga/stylesheets /etc/icinga/stylesheets
  Alias /icinga /usr/share/icinga/htdocs
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} 
  RewriteCond %{REQUEST_URI} !^/health_check
  ErrorLog /var/log/apache2/monitor_errors.log
  CustomLog /var/log/apache2/monitor_access.log combined
  <DirectoryMatch (/usr/share/icinga/htdocs|/usr/lib/cgi-bin/icinga|/etc/icinga/stylesheets)>
        Options FollowSymLinks
        DirectoryIndex index.html
        AllowOverride AuthConfig
        Order Allow,Deny
        Allow From All
        AuthName "Icinga Access"
        AuthType Basic
        AuthUserFile /etc/icinga/htpasswd.users
        Require valid-user
  </DirectoryMatch>
</VirtualHost>
<VirtualHost *:443>
  ServerName monitor.mydomian.com
  ServerAdmin admin@mydomain.com
  DocumentRoot /usr/share/icinga/htdocs
  ScriptAlias /cgi-bin/icinga /usr/lib/cgi-bin/icinga
  ScriptAlias /icinga/cgi-bin /usr/lib/cgi-bin/icinga
  Alias /icinga/stylesheets /etc/icinga/stylesheets
  Alias /icinga /usr/share/icinga/htdocs
  LogLevel warn
  ErrorLog /var/log/apache2/monitor_errors.log
  CustomLog /var/log/apache2/monitor_access.log combined
  SSLEngine on
  BrowserMatch "MSIE [2-6]" nokeepalive ssl-unclean-shutdown downgrade-1.0 force-response-1.0
  BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
  SSLCertificateFile /etc/ssl/monitor_ssl/STAR_mydomain_com.crt
  SSLCertificateKeyFile /etc/ssl/monitor_ssl/mydomain.com.key
  SSLCertificateChainFile /etc/ssl/monitor_ssl/STAR_mydomain_com-bundle.crt
  <DirectoryMatch (/usr/share/icinga/htdocs|/usr/lib/cgi-bin/icinga|/etc/icinga/stylesheets)>
        Options FollowSymLinks
        DirectoryIndex index.html
        AllowOverride AuthConfig
        Order Allow,Deny
        Allow From All
        AuthName "Icinga Access"
        AuthType Basic
        AuthUserFile /etc/icinga/htpasswd.users
        Require valid-user
  </DirectoryMatch>
</VirtualHost>
```

* Enable the newly created virtualhost using a2ensite, Restart the apache2 service.


That's it we have done. Add more service what ever we need to get monitor.


