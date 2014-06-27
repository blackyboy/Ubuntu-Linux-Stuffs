#### Installation Of Two Default ubuntu12.04 LTS Servers Machines

Prepare two ubuntu12.04 LTS Servers machines with a minimal setup. Build yourself a good working environment.


In this how to I will refer to the following default configuration:

```

Nagios Host:
Hostname: monitoring

IP: 192.168.1.20

Example Server:
Hostname: app-gem-srv


IP: 192.168.1.30

```

 Install Nagios


```

monitoring:~# apt-get install build-essential apache2 php5-gd libgd2-xpm libgd2-xpm-dev libapache2-mod-php5

app-gem-srv:~# apt-get install nagios-nrpe-server nagios-plugins

                              (or) latest version 

#wget http://sourceforge.net/projects/nagiosplug/files/nagiosplug/1.4.15/nagios-plugins-1.4.15.tar.gz

```


 Putting Up A Basic Nagios Configuration On The monitoring Host


To get access to the Nagios Configuration Page we have to set the password for the nagiosadmin user:


```
monitoring:~# htpasswd -c /etc/nagios3/htpasswd.users nagiosadmin

```

After this you should be able to login to: http://192.168.1.20/nagios3/ with the username nagiosadmin and the password you just set before.

If you go to the service detail site you will see that Nagios provides already a basic configuration for the localhost.


 Install A Webserver On The Example Server

```
app-gem-srv:~# apt-get install apache2

```

 Create A New Config File On The Nagios Host

```
monitoring:~# nano /etc/nagios3/conf.d/app-gem-srv_nagios2.cfg

```


```
define host{
        use             generic-host
        host_name       app-gem-srv
        alias           app-gem-srv
        address         192.168.1.30
}
define service{
        use                     generic-service
        host_name               app-gem-srv
        service_description     HTTP-Server
        check_command           check_http
}

```

Restart the nagios service with:


```

monitoring:~# /etc/init.d/nagios3 restart

```

You should now be able to see the app-gem-srv and http service on the Service Detail Site of Nagios.


Prepare nrpe Client On app-gem-srv To Submit More Data To Nagios


We have to change the nrpe config of the server we want to overwatch, first change the line for the allowed host (line 79 by default):



```

app-gem-srv:~# nano /etc/nagios/nrpe.cfg


```


From


```
allowed_hosts=127.0.0.1

```

to

```

allowed_hosts=192.168.1.20

```

Restart the nrpe service on app-gem-srv:


```

app-gem-srv:~# /etc/init.d/nagios-nrpe-server restart

```

Check the nrpe-service by hand before we continue to change the config. We do this from our Nagios host.


```

monitoring:~# cd /usr/lib/nagios/plugins/

monitoring:/usr/lib/nagios/plugins# ./check_nrpe -H 10.10.10.100 -c check_users

```

The output should be something like this:


USERS OK - 2 users currently logged in |users=2;5;10;0



-------------------------------------------------------------------------------

Nagios Plugin Installation

```
#cd /tmp/nagios-plugins-1.4.15 

#./configure --with-nagios-user=nagios --with-nagios-group=nagios 

#make 

#make install

```
-------------------------------------------------------------------------------

