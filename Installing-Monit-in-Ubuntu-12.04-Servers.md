Installing Monit in Ubuntu 12.04 Servers 


Monit is a utility for managing and monitoring, processes, files, directories and devices on a UNIX system. Monit conducts automatic maintenance and repair and can execute meaningful causal actions in error situations.


Installing in ubuntu using command


```
#sudo apt-get install monit 

```

Configure the configuration file in 


```

#/etc/monit/monitrc 


```

configuration File Entry 


```

The Default Port Number of Monit is 2812 .
Start Monit in the background and check services at every one minute
set daemon 60
Set syslog logging with the 'daemon' facility.
set logfile /var/log/monit.log
Set the location of the Monit id file which stores the unique id for the  Monit instance
set idfile /var/lib/monit/id

```


Uncomment the following lines

```
set httpd port 2812 and
#use address localhost  # only accept connection from localhost
#allow localhost        # allow localhost to connect to the server and
allow admin:monit      # require user 'admin' with password 'monit'
allow @monit           # allow users of group 'monit' to connect (rw)
allow @users readonly  # allow users of group 'users' to connect readonly


```


start monit 
		

```

sudo /etc/init.d/monit start


```


Now navigate to http://localhost:2812/ from your browser. Enter the username as admin and password as monit. 
Adding additional configuration parts from other files or directories.


```

include /etc/monit/conf.d/*

```

Checking syntax


```
sudo monit -t

```

Monit Details

```

sudo monit status

```

Adding services 

Postgresql

```
	check process postgresql-9.2 with pidfile /var/run/postgresql/9.2-main.pid
	group database
	start program = "/etc/init.d/postgresql start"
	restart program = "/etc/init.d/postgresql restart"
	start program = "/etc/init.d/postgresql stop"
	if failed host 192.168.1.77 port 5432 then restart
	if 5 restarts within 5 cycles then timeout

```


Nginx


```

	check process nginx with pidfile /var/run/nginx.pid
	start program = "/etc/init.d/nginx start"
	stop program = "/etc/init.d/nginx stop"

```


Redis



```

check process redis with pidfile /var/run/redis/redis.pid
start program = "/etc/init.d/redis-server start"
stop program = "/etc/init.d/redis-server stop"
group redis

```

Disk Check For VDA 


```

check device disk1 with path /dev/vda
start = "/bin/mount /dev/vda"
stop = "/bin/umount /dev/vda"
if space usage > 90% then alert
if space usage > 99% then stop
if inode usage > 90% then alert
if inode usage > 99% then stop
alert babin@blablabla.com		

```



This For Monitoring Tomcat server 



```
#Tomcat Monitoring 

 check host tomcat with address localhost
 stop program = "/etc/init.d/tomcat stop"
 start program = "/etc/init.d/tomcat restart"
 if failed port 8080 and protocol http
 then start
```




This for Monitoring SSH Server




```
#SSH Monitoring 

check process sshd with pidfile /var/run/sshd.pid
   start program  "/etc/init.d/sshd start"
   stop program  "/etc/init.d/sshd stop"
   if failed port 22 protocol ssh then restart
   if 5 restarts within 5 cycles then timeout
```


This For Monitoring Fail2ban


```
check process fail2ban with pidfile /var/run/fail2ban/fail2ban.pid
  group services
  start program = "/etc/init.d/fail2ban start"
  stop  program = "/etc/init.d/fail2ban stop"
  if 5 restarts within 5 cycles then timeout

```


This For Monitoring Freeswitch


```

#Free Switch

  check process freeswitch with pidfile /opt/freeswitch/run/freeswitch.pid
  start program = "/usr/local/freeswitch/bin/./freeswitch -nc -u www-data"
  stop program  = "/usr/local/freeswitch/bin/./freeswitch -stop"

```


This for Monitoring MYSQL




```
# MySQL Monitoring 


Add this to your my.cnf under [mysqld]

pid-file=/var/run/mysqld/mysqld.pid


And this to your monit config

check process mysql with pidfile /var/run/mysqld/mysqld.pid
   group database
   start program = "/etc/init.d/mysql start"
   stop program = "/etc/init.d/mysql stop"
   if failed host 127.0.0.1 port 3306 protocol mysql then restart
   if 5 restarts within 5 cycles then timeout
   depends on mysql_rc

 check file mysql_rc with path /etc/init.d/mysql
   group database
   if failed checksum then unmonitor
   if failed permission 755 then unmonitor
   if failed uid root then unmonitor
   if failed gid root then unmonitor
```



To Start the monit 


```

# vim /etc/default/monit 


```

Then Set the Value 0 to 1
set the "startup" variable to 1 in order to allow


```

startup=0 to startup=1


```


Then Start the monit service Using command 


```

# sudo /etc/init.d/monit start


```



### All In One Code 





```
#Nginx


	check process nginx with pidfile /var/run/nginx.pid
	start program = "/etc/init.d/nginx start"
	stop program = "/etc/init.d/nginx stop"


#Redis
	check process redis with pidfile /var/run/redis.pid
  	start program = "/etc/init.d/redis-server-2.2.4 start"
  	stop program = "/etc/init.d/redis-server-2.2.4 stop"
  	group redis


#Check DevicE
        check device disk1 with path /dev/vda
        start = "/bin/mount /dev/vda"
        stop = "/bin/umount /dev/vda"
        if space usage > 90% then alert
        if space usage > 99% then stop
        if inode usage > 90% then alert
        if inode usage > 99% then stop
        alert babin@blablabla.com

#Tomcat Monitoring 

   	check host tomcat with address localhost
   	stop program = "/etc/init.d/tomcat6 stop"
   	start program = "/etc/init.d/tomcat6 restart"
   	if failed port 8080 and protocol http
   	then start



#SSH Monitoring 


   	check process sshd with pidfile /var/run/sshd.pid
  	start program  "/etc/init.d/sshd start"
  	stop program  "/etc/init.d/sshd stop"
   	if failed port 22 protocol ssh then restart
  	if 5 restarts within 5 cycles then timeout


#Fail2ban Monitoring

  	check process fail2ban with pidfile /var/run/fail2ban/fail2ban.pid
  	group services
  	start program = "/etc/init.d/fail2ban start"
 	stop  program = "/etc/init.d/fail2ban stop"
 	if 5 restarts within 5 cycles then timeout


#Free Switch

  	check process freeswitch with pidfile /opt/freeswitch/run/freeswitch.pid
  	start program = "/usr/local/freeswitch/bin/./freeswitch -nc -u www-data"
  	stop program  = "/usr/local/freeswitch/bin/./freeswitch -stop"


##Apache Monitoring 

        check process apache with pidfile /var/run/apache2.pid
        start program = "/etc/init.d/apache2 start" with timeout 60 seconds
        stop program = "/etc/init.d/apache2 stop"
        if cpu > 60% for 2 cycles then alert
        if cpu > 80% for 5 cycles then restart
        if totalmem > 200.0 MB for 5 cycles then restart
        if children > 250 then restart
        if loadavg(5min) greater than 10 for 8 cycles then stop
#       if failed host www.tildeslash.com port 80 protocol http
#        and request "/somefile.html"
#       then restart
#       if failed port 443 type tcpssl protocol http
#       with timeout 15 seconds
#       then restart
        if 3 restarts within 5 cycles then timeout
#       depends on apache_bin
        group server


```

