Setting up a Virtual Server or Physical Server in Ubuntu

#### System Update:


Before perform any action make sure server is up-to-date. Update the repo and upgrade the packages using.

```
# sudo apt-get update && sudo apt-get upgrade -y
```

#### Check for swap enable.

```
# swapon -s
```

If it's not enabled enable it using 

```
# swapon -a
```

#### Adding Swap file if not swap partition available.

Note:> If no swap space from hosting providers create a Space file using below steps, Creating 2GB Swap file here.

```
# sudo dd if=/dev/zero of=/swapfile bs=2G count=2
```

Change the permission of swapfile only read and write by root user.

```
sudo chmod 600 /swapfile
```

Create swap filesystem using mkswap

```
sudo mkswap /swapfile
```

Activate the swap space using and check for the status.

```
sudo swapon /swapfile
sudo swapon -s
```

Performance tunning for Swap, By default we have swappiness value with 60 change it to 10

```
cat /proc/sys/vm/swappiness 

sudo sysctl vm.swappiness=10
sudo sysctl vm.vfs_cache_pressure=50
```

or edit using 

```
vim /etc/sysctl.conf

vm.swappiness=10
vm.vfs_cache_pressure = 50
```

#### Update the Date & Current time for server using Zone information.


* Remove the default timezone information using 

```
# sudo rm -rfv /etc/localtime
```

* Then create a soft link from zone information to localtime.

```
# sudo ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
```

#### User creation:

* First Create a user sysadmin

```
# sudo useradd -m -s /bin/bash sysadmin
```

* Create a password for sysadmin

```
# sudo passwd sysadmin
```

* Add the Created Sysadmin user to Sudo Group to get root privileges

```
# sudo usermod -a -G sudo sysadmin
```

If we need a account for developer we can create without any pervileges except restarting apache2 service.

After creating a user account for developer never add the user to sudo group. Instead allow him to restart only apache2, nginx service.

```
# sudo visudo

# developer ALL=(ALL) NOPASSWD: /etc/init.d/apache2, /etc/init.d/nginx
```

#### SSH configuration tweak:

Note:> Same settings can be done for desktop machines too, For desktop machines we can remove the openssh-server pacakge.


* First check for Protocol, It want to use 2 if 1 used in protocol server will be under man in middle attack.


```
# Protocol 2
```

* Change the Port number for ssh to any value, I'am using 2222


* Gives the verbosity level that is used when logging messages from sshd. Set a Logging level, Never use debug1,2,3 this violates the privacy of users. By default level Login will be INFO.


```
# LogLevel VERBOSE
```

* Define server key bit to use. Default is 1024.


```
# ServerKeyBits 2048
```

* Change the Login Grace time to low value, Default will be 120 Seconds (2 Minutes). Here i'am using 30 seconds.


```
# LoginGraceTime 30
```


* Disabling Root login

I'am going to setup a Key later instead of using password authentication. By default it will be yes here i have used without-password becuase not going to use a password only i use a keyfile to login root.


```
# PermitRootLogin without-password
```


* Add the denied Users to restirct. User billgates can't ssh into the server.


```
DenyUsers billgates
```


* Add the allowed Users to restirct other user's


```
AllowUsers sysadmin devops user3

```


* Set a Warning Banner, Uncomment the Banner.


```
#Banner /etc/issue.net
```

* And edit the file in /etc/issue.net for banner while ssh login 

```
NOTICE TO USERS

This computer system is the private property of its owner, whether
individual, corporate or government.  It is for authorized use only.
Users (authorized or unauthorized) have no explicit or implicit
expectation of privacy.

Any or all uses of this system and all files on this system may be
intercepted, monitored, recorded, copied, audited, inspected, and
disclosed to your employer, to authorized site, government, and law
enforcement personnel, as well as authorized officials of government
agencies, both domestic and foreign.

By using this system, the user consents to such interception, monitoring,
recording, copying, auditing, inspection, and disclosure at the
discretion of such personnel or officials.  Unauthorized or improper use
of this system may result in civil and criminal penalties and
administrative or disciplinary action, as appropriate. By continuing to
use this system you indicate your awareness of and consent to these terms
and conditions of use. LOG OFF IMMEDIATELY if you do not agree to the
conditions stated in this warning.

*************************************************************************
```

* Maximum authentication attempts:

Specifies the maximum number of authentication attempts permitted per connection.  Once the number of failures reaches half this value, additional failures are logged.  The default is 6.


```
# MaxAuthTries 3
```

* Maximum Sessions permitted from Single network connection. Default will be 10.


```
# MaxSessions 3
```


* SSH CLient intervel Setup:


```
# ClientAliveCountMax 0
# ClientAliveInterval 120
```

* Allowed maximum number of concurrent unauthenticated connections. Default will be 10:30:100. If we need only the 3 connections need to obtian and no need of rate remove the :30:100.


```
# MaxStartups 3:30:100
```

* To print the Last log information.


```
PrintLastLog yes
```


* Data integrity protection using MACs. This will differ from Ubuntu and Centos, We have to choose the matched options.


```
# MACs hmac-md5-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-ripemd160-etm@openssh.com,hmac-sha1-96-etm@openssh.com,hmac-md5-96-etm@openssh.com,hmac-md5,hmac-sha1,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-ripemd160,hmac-sha1-96,hmac-md5-96
```

#### Sudo execution email notification:

Edit the visudo using


```
# sudo visudo
```

Append the below config in end of sudoer file.


```
Defaults    mailfrom = "sysadmin@domain.com"
Defaults    mailsub = "*** Command run via sudo on %h ***"
Defaults    badpass_message = "Please Provide Correct Password"
Defaults    !lecture,tty_tickets,!fqdn,!syslog
Defaults    logfile=/var/log/sudo.log
```

#### E-mail notification while SSH login in VPS servers Using Gmail forwarder

* Install the mail package using 

```
# sudo apt-get install exim4 -y
```

* Configure exim4 using 

```
# sudo dpkg-reconfigure exim4-config
```

1. Choose General type of mail configuration: mail sent by smarthost; received via SMTP or fetchmail

2. System mail name: "your VPS hostname"

3. IP-address to listen on for incoming SMTP connections: 127.0.0.1

4. Other destinations for which mail is accepted: "your VPS hostname"

5. Machines to relay mail for: "Just leave it blank"

6. IP address or host name of the outgoing smarthost: smtp.gmail.com::587

7. Hide local mail name in outgoing mail?


```
Yes - all outgoing mail will appear to come from your gmail account
No - mail sent with a valid sender name header will keep the sender’s name
```

8. Keep number of DNS-queries minimal (Dial-on-Demand)? No

9. Delivery method for local mail: "Our Chooise"

10. Split configuration file into small files? Yes 


* Edit the configuration of passwd.client under

```
# sudo vim /etc/exim4/passwd.client
```

Append the below content with your email id and password


```
gmail-smtp.l.google.com:"my-email-address":"mypassword"
*.google.com:"my-email-address":"mypassword"
smtp.gmail.com:"my-email-address":"mypassword"
```

* Update the config Using 

```
# sudo update-exim4.conf
```

* Restart the exim4 Service using.


```
# sudo /etc/init.d/exim4 restart
```

* Send a test mail and check using.

```
mail my-email-address@mydomain.com
```

Or 

```
# echo "test mail from VPS." | mail -s Test devops@yourdomain.com
```

* Check for logs under if error occured.

```
# sudo tail -f /var/log/exim4/mainlog
```

* To set a SSH notification we have to do the below steps.

Edit the file .bashrc under every users home directory.


```
# sudo vim ~/.bashrc
```

Append the below setof command and save the bashrc file and exit and login again to check the mail.

```
echo 'ALERT - ROOT Shell Access in Server on:' `date` `who` | mail -s "Alert: ROOT User Access from `who | cut -d'(' -f2 | cut -d')' -f1`" my-email-address@mydomain.com.
```

This will route to Gmail and send the mail to any mail address.


##### Protecting from DDOS attack using fail2ban.

First we need to install fail2ban by using 

```
# sudo apt-get install fail2ban 
```

Move the file jail.conf to the same location as jail.local

```
# cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Change the Configuration to below as mentioned 


```
[DEFAULT]
# "ignoreip" can be an IP address, a CIDR mask or a DNS host
ignoreip = 192.168.1.25
bantime  = 3600
maxretry = 3
```

Here 192.168.1.77 is the Ip were is our server, Bantime set for 1 Hour, maximum try for login 3 times after that bot ip will be added to black list. 
 

This want to be Enabled

```
backend = auto
```

Check the ssh for Protection 

```
[ssh]
enabled  = true
port     = 2222
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 3
```

Here if we need to enable the service for ssh we need to change it to true 
And the Port number is 2222 for ssh in my system for testing 
filter want to be sshd 
max try is 3 times if not it will block and give us log.


* To get mail when ever Rules match

Change action_mw to action = %(action_mwl)s


* rules to protect nginx 

```
[nginx]
enabled = true
port    = http,https
filter  = apache-auth
logpath = /var/log/nginx*/*error.log
maxretry = 3

[nginx-noscript]
enabled = true
port    = http,https
filter  = apache-noscript
logpath = /var/log/nginx*/*error.log
maxretry = 3

[nginx-overflows]
enabled = true
port    = http,https
filter  = apache-overflows
logpath = /var/log/nginx*/*error.log
maxretry = 2

[apache-badbots]
enabled  = true
port    = http,http
filter   = apache-badbots
logpath  = /var/log/nginx*/*access.log
bantime  = 172800
maxretry = 1
```

#### Setup Log Rotate.

Log rotation is an automated process used in system administration in which dated log files are archived. In general, it is used on servers. Servers which run large applications, such as LAMP stacks, often log every request, and as such, the process of log rotation may be beneficial.

* Files and Directories used by Logrotate

Configuration file will be Under

```
/etc/logrotate.conf
```

Information about last log rotate

```
# cat /var/lib/logrotate/status
```

* The directory thats usually used by logrotate is

```
/etc/logrotate.d
```

Add the following line in /etc/logrotate.conf 

```
include /etc/logrotate.d
```

* To add Log rotating for particular service


```
# vim /etc/logrotate.d/service_name
```

##### Understanding the Options in Logrotate.

* daily – Rotate the log files each day. You can also use weekly or monthly here.
* missingok – If the log file doesn’t exist, ignore it
* rotate 7 – Only keep 7 days of logs around
* compress – GZip the log file on rotation
* delaycompress – Rotate the file one day, then compress it the next day so we can be sure that it won’t interfere with the Rails server
* notifempty – Don’t rotate the file if the logs are empty
* copytruncate – Copy the log file and then empties it. This makes sure that the log file apache2 is writing to always exists so you won’t get problems because the file does not actually change. If you don’t use this, you would need to restart your apache2 service each time.


* To manually run logrotate :

```
sudo logrotate -f -v /etc/logrotate.d/service_name
```


#### Install and Configure Logwatch to get server information daily in mail.

* Install Logwatch using 

```
# sudo apt-get install logwatch
```

* Edit logwatch.conf file

```
#  /usr/share/logwatch/default.conf/logwatch.conf
```

* Change the following:

```
# Output = mail
# Format = html
# MailTo = user@domain.com
```

Save and Exit using wq!


* Edit the file 00logwatch to append the mail were we need to get the Logs


```
# /etc/cron.daily/00logwatch
```

* Add the following line.

```
# /usr/sbin/logwatch --mailto user@domain.com
# /usr/sbin/logwatch --mailto logwatcher@live.com
```

Save and exit using wq!

* Test the Logwatch using command 

```
# logwatch
```

* If we need get log in specific time add in cronjob as below

Create a Cronjob using 

```
crontab -e
```

Append the Below Content

```
# m h dom mon dow   command
01 12  * * *          /usr/sbin/logwatch
```

That's it we have setup-ed logwatch.


#### Disable CronJob's for every user except O.

#### Diable at for every user except 0.


```
sudo vim /etc/at.deny
```

#### Monitoring with monit.

Monit is a utility for managing and monitoring, processes, files, directories and devices on a LINUX/UNIX system.
Monit conducts automatic maintenance and repair and can execute meaningful causal actions in error situations.

* Install monit using 

```
# sudo apt-get install monit 
```
Configure the configuration file in 

```
#/etc/monit/monitrc 
```

* configuration have to modify.

```
The Default Port Number of Monit is 2812 .
Start Monit in the background and check services at every one minute
set daemon 60
Set syslog logging with the 'daemon' facility.
set logfile /var/log/monit.log
Set the location of the Monit id file which stores the unique id for the  Monit instance
set idfile /var/lib/monit/id
```

* Uncomment the following lines

```
set httpd port 2812 and
#use address localhost  # only accept connection from localhost
#allow localhost        # allow localhost to connect to the server and
allow admin:monit      # require user 'admin' with password 'monit'
allow @monit           # allow users of group 'monit' to connect (rw)
allow @users readonly  # allow users of group 'users' to connect readonly
```

* start monit service using 
		
```
# sudo /etc/init.d/monit start
```

Now navigate to http://localhost:2812/ from your browser. Enter the username as admin and password as monit, Adding additional configuration parts from other files or directories.

By default this will be in end of monit config file.

```
include /etc/monit/conf.d/*
```

* Adding services to monitor

1. Disk Check For VDA 

```
check device disk1 with path /dev/vda1
start = "/bin/mount /dev/vda1"
stop = "/bin/umount /dev/vda1"
if space usage > 90% then alert
if space usage > 99% then stop
if inode usage > 90% then alert
if inode usage > 99% then stop
alert root@domain.com		
```

2.  Monitoring SSH Server

```
check process sshd with pidfile /var/run/sshd.pid
start program  "/etc/init.d/sshd start"
stop program  "/etc/init.d/sshd stop"
if failed port 22 protocol ssh then restart
if 5 restarts within 5 cycles then timeout
alert root@domain.com
```

3. Monitoring Fail2ban

```
check process fail2ban with pidfile /var/run/fail2ban/fail2ban.pid
group services
start program = "/etc/init.d/fail2ban start"
stop  program = "/etc/init.d/fail2ban stop"
if 5 restarts within 5 cycles then timeout
alert root@domain.com
```

4. #Check DevicE
   
```
check device disk1 with path /dev/vda
start = "/bin/mount /dev/vda"
stop = "/bin/umount /dev/vda"
if space usage > 90% then alert
if space usage > 99% then stop
if inode usage > 90% then alert
if inode usage > 99% then stop
alert root@domain.com
```

* Checking syntax, Check status using.

```
# sudo monit -t , # sudo monit status
```

* Then Start the monit service Using command 

```
# sudo /etc/init.d/monit start
```

#### Secure server using Iptables.


Create a script using below rules and run it to deploy the rules. This Rules for Default chain as DROP. Change the ssh port according to your need.

```
# Flush every Rules, Flush the NAT table Rules, Delete the NAT Chain

iptables -F
iptables -t nat -F
iptables -t nat -X

# Flush the Mangle table Rules, Delete the Mangle Chain.

iptables -t mangle -F
iptables -t mangle -X

# Set the INPUT, OUTPUT, FORWARD chain Policy to default as DROP.

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Accept the incomming & Outgoing request in localhost adapter into in-interface & out-interface.

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Match the state of connection which established and accept it in incomming & outgoing interface traffic.

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -m state --state INVALID -j DROP

# Null packets are, simply said, recon packets. see how we configured the VPS and find out weaknesses, Reject is a syn-flood attack, XMAS packets, also a recon packet.

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Ethernet allows ICMP echo (PING) with rate limiting.
iptables -A INPUT -i eth+ -m state --state NEW -p icmp -m icmp --icmp-type echo-request -j ACCEPT
iptables -I INPUT -i eth+ -m icmp -p icmp --icmp-type echo-request -m recent --set
iptables -I INPUT -i eth+ -m icmp -p icmp --icmp-type echo-request -m recent --update --seconds 10 --hitcount 10 -j DROP

# Allow the ssh port for incoming & outgoing traffic to accept NEW & already Established connection in both tcp/udp protocols.

iptables -A INPUT -i eth0 -p tcp --dport 2222 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 2222 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth0 -m state --state NEW,ESTABLISHED -m tcp -p tcp --dport 2222 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state ESTABLISHED -m tcp -p tcp --dport 2222 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -A INPUT -i eth0 -p udp --dport 2222 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 2222 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth0 -m state --state NEW,ESTABLISHED -m udp -p udp --dport 2222 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state ESTABLISHED -m udp -p udp --dport 2222 -m recent --update --seconds 10 --hitcount 5 -j DROP


# Allow the ntp port for incoming & outgoing traffic to accept NEW & already Established connection in udp protocols.

iptables -A INPUT -i eth0 -p udp --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 123 -m state --state ESTABLISHED -j ACCEPT

# Allow the http & https incoming & outgoing traffic to accept NEW & already Established connection in both tcp/udp protocols.

iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth0 -m state --state NEW -m tcp -p tcp --dport 80 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state NEW -m tcp -p tcp --dport 80 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I INPUT -i eth0 -m state --state NEW -m udp -p udp --dport 80 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state NEW -m udp -p udp --dport 80 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 443 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT -i eth0 -m state --state NEW -m tcp -p tcp --dport 443 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state NEW -m tcp -p tcp --dport 443 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I INPUT -i eth0 -m state --state NEW -m udp -p udp --dport 443 -m recent --update --seconds 10 --hitcount 5 -j DROP
iptables -I OUTPUT -o eth0 -m state --state NEW -m udp -p udp --dport 443 -m recent --update --seconds 10 --hitcount 5 -j DROP

# Create a New Chain LOGGING and allow logging for INPUT chain.

iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -m limit --limit 10/min -j LOG --log-prefix "Iptables packet's Dropped: " --log-level 7

# Except every above rules reject the inbound traffic.

iptables -A INPUT -j DROP
```

* To list the rules use, To list the iptables.

```
iptables -S , # iptables -L -n -v --line-numbers
```
* Use firewall script from dropbox. And update the runlevel.


* Change permission and mod


```
# sudo update-rc.d firewall.bash defaults
```

* Creating ssh key for client's

```
# ssh-keygen -t rsa -b 4096 -C "admin@devops.com" -f ~/.ssh/web_servers
```


