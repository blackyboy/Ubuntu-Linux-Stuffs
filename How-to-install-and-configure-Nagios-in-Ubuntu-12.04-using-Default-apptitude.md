How to install and configure Nagios in Ubuntu 12.04 using Default apptitude 

Search the apptitude of nagios 

```
# sudo aptitude search nagios 
```

To install nagios3 from apptitude 

```
# sudo aptitude install nagios3
```

To list the installed packages of nagios 

```
#apkg -l | grep -i nagios
 
```

This one only display the files of nagios 

```
#dpkg -L nagios 3

```

Using this command we can see the core package of nagios 

```
#dpkg -L nagios3-core 

```

This is common package of nagios and this contain all the plugins etc ..

```
#dpkg -L nagios3-common 

```

config files Will be located under 

```
#etc/nagios/ ls -l

```
To have a look at plugins
 
```
#../nagios-plugins/config/

```

To view the plugins commands

```
# cat ../nagios-plugins/config/tcp_udp.cfg

```

this will display the commands of particular plugins commands 


Default Object types will be under 

```
# /etc/nagios3/conf.d/ls -l

```

Have a brife look at the plugins under 

```
# cd /usr/lib/nagios/plugins/

#ls -l

```

To View the Files (Binary Files)

```
# file * 

```
To see the build and arch of the Build

```
# files check_icmp

```

To see the command of the Plugins 

```
#./check_icmp --help

```

To Configure 

```
# etc/nagios3/conf.d/

```

To change the default localhost to System name Which Nagios Running 

```
# etc/nagios3/conf.d/localhost_nagios2.cfg

```
Open it and copy the generic host first content block and create a new file called hostname.cfg 

```
#sudo vim /nagiosserver.cfg

```
And Paste the content from there copied 

Change the Host name and alias as long u wish 

```
-- ---- ---- ---- --- --- --- - -- - - - -- - - -- - 


define host{
	use		generic-host		;Name of host template to use 
	host_name	nagiosserver		
	alias		Ubuntu build linux for Monitoring 
	address		192.168.1.20
	}

--  - - - - - - - - - -  - - - -  - - - - -  - - - - - 

```
Save it and close 


```
# wq!

```
To view the generic host for a template 


```
#cat /etc/nagios3/conf.d/generic-host_nagios2.cfg 

```

To know the ports 

```
# which nmap 

# nmap -v 192.168.1.20

```
Shows all opened ports 

Then chooose the plugins and get installed and monitor the servers 

