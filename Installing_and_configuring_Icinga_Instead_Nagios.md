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

That's it we have done. Add more service what ever we need to get monitor.


