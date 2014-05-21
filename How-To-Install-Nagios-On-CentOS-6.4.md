                              How To Install Nagios On CentOS 


 Install Packages on Monitoring Server


```

#rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

#yum -y install nagios nagios-plugins-all nagios-plugins-nrpe nrpe php httpd

#chkconfig httpd on && chkconfig nagios on

#service httpd start && service nagios start

```

----------------------------------------------------------


We should also enable SWAP memory on this droplet, at least 2GB



```

dd if=/dev/zero of=/swap bs=1024 count=2097152
mkswap /swap && chown root. /swap && chmod 0600 /swap && swapon /swap
echo /swap swap swap defaults 0 0 >> /etc/fstab
echo vm.swappiness = 0 >> /etc/sysctl.conf && sysctl -p

```


----------------------------------------------------------


Set Nagios Admin Panel Password


```

htpasswd -c /etc/nagios/passwd nagiosadmin


```

----------------------------------------------------------


Make sure to keep this username as "nagiosadmin" - otherwise you would have to change /etc/nagios/cgi.cfg and redefine authorized admin.

Now you can navigate over to your droplet's IP address http://IP/nagios and login.


----------------------------------------------------------


Now we should add our hosts that will be monitored by Nagios. For example, we will use app-Web-Srv (198.168.1.55) and sambafileserver (198.168.1.15).

From public ports, we can monitor ping, any open ports such as webserver, e-mail server,samba etc.

For internal services that are listening on localhost, such as MySQL, memcached, system services, we will need to use NRPE.


----------------------------------------------------------


Install NRPE on Clients (Nagios Clients)


```

#rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

#rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

#yum -y install nagios nagios-plugins-all nrpe

#chkconfig nrpe on


```

-------------------------------------------------------------------------

This next step is where you get to specify any manual commands that Monitoring server 
can send via NRPE to these client hosts.

Make sure to change allowed_hosts to your own values. 

```

#vim /etc/nagios/nrpe.cfg

```

-------------------------------------------------------------------------

```

log_facility=daemon
pid_file=/var/run/nrpe/nrpe.pid
server_port=5666
nrpe_user=nrpe
nrpe_group=nrpe
allowed_hosts=198.211.117.251
dont_blame_nrpe=1
debug=0
command_timeout=60
connection_timeout=300
include_dir=/etc/nrpe.d/
command[check_users]=/usr/lib64/nagios/plugins/check_users -w 5 -c 10
command[check_load]=/usr/lib64/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,sda2,sda3
command[check_zombie_procs]=/usr/lib64/nagios/plugins/check_procs -w 5 -c 10 -s Z
command[check_total_procs]=/usr/lib64/nagios/plugins/check_procs -w 150 -c 200
command[check_procs]=/usr/lib64/nagios/plugins/check_procs -w $ARG1$ -c $ARG2$ -s $ARG3$


```

-------------------------------------------------------------------------

We should also setup firewall rules to allow connections from our 
Monitoring server to those clients and drop everyone else:


```

iptables -N NRPE
iptables -I INPUT -s 0/0 -p tcp --dport 5666 -j NRPE
iptables -I NRPE -s 198.211.117.251 -j ACCEPT
iptables -A NRPE -s 0/0 -j DROP

```

Save the Iptables Entires


```
# /etc/init.d/iptables save

```


Start the nrpe Service as Below :

```

# service nrpe start

```


Add Server Configuration on monitoring Server 

```


#sudo vim /etc/nagios3/conf.d/sambafileserver_nagios2.cfg



```

-------------------------------------------------------------------------



Add the following lines



```

define host {
        use                   	        generic-host
        host_name              	        sambafileserver
        alias                   	sambafileserver
        address                 	192.168.1.15
        }

define service{
        use                     	generic-service		; Name of service template to use
        host_name               	sambafileserver
        service_description     	HTTP-Server
        check_command           	check_http
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       sambafileserver
        service_description             Disk Space
        check_command                   check_all_disks!20%!10%
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       sambafileserver
        service_description             Current Users
        check_command                   check_users!20!50
}

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       sambafileserver
        service_description             Total Processes
        check_command                   check_procs!250!400
}

define service {
        use                             generic-service		; Name of service template to use
        host_name                       sambafileserver
        service_description             PING
        check_command                   check_ping!100.0,20%!500.0,60%
        }

define service {
        use                             generic-service		; Name of service template to use
        host_name                       sambafileserver
        service_description             SSH
        check_command                   check_ssh
        notifications_enabled           0
        }
define service{
        use                             generic-service         ; Name of service template to use
        host_name                       sambafileserver
        service_description             Current Load
        check_command                   check_load!5.0!4.0!3.0!10.0!6.0!4.0
}

```

Finally, after you are done adding all the client configurations, 
you should set folder permissions correctly and restart Nagios on your Monitoring Server:


```
# chown -R nagios. /etc/nagios

# service nagios restart

```


Open the browser and Entire Your Nagios Servers Ip/nagois3 version  (http://192.168.1.20/nagios3)
And entire Your User as nagiosadmin
                Password as ur Given .. 


