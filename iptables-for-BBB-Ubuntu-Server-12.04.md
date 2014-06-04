```
#!/bin/bash
#This Script was Used for Only Setting up Iptables in ubuntu 12.04 server
#uncomment the Lines With # Which u don't need to use 
#if u going to use this script in remote VPS Test it in local systems before applying it in remote VPS .

sleep 2

set -x

# Drop everything to secure, And Don't Apply Only this below Rules by indivual if so you will loose Connectivity 
 
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Null packets are, simply said, recon packets. see how we configured the VPS and find out weaknesses.

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Reject is a syn-flood attack

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# XMAS packets, also a recon packet

iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#Allow Connectivity from localhost

iptables -A INPUT -i lo -j ACCEPT

# Keep the Connection already Existed

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allowing SSH

iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT

# web server traffic {http port 80, and https port 443}

iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

# SMPT Server

iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT

# POP3 NON SSL, SSL  

iptables -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT

# IMAP, IMAP Over SSL traffic

iptables -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT

# Limiting SSH access

iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# allow traffic to SSH port if it comes from one source, Our IP address

# Here my IP address is 192.168.1.200

iptables -A INPUT -p tcp -s 192.168.1.200 -m tcp --dport 22 -j ACCEPT

# Messaging Protocal for bigbluebutton

iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 9123 -j ACCEPT

# Adobe Flash Media (RTMP)

iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 1935 -j ACCEPT

# Limiting http Request

iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT

# Allowing Monit, Monitoring Service

iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2812 -j ACCEPT

# Disable the Ping 

iptables -A OUTPUT -p icmp --icmp-type 8 -j DROP

# Rsync

iptables -A INPUT -i eth0 -p tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --sport 873 -m state --state ESTABLISHED -j ACCEPT

# Redirect the 80 to 8080

iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 80 -j REDIRECT --to-port 8080

# Enabling Logging

iptables -N LOGGING

iptables -A INPUT -j LOGGING

iptables -A LOGGING -m limit --limit 10/min -j LOG --log-prefix "IPTables Packet Dropped: " --log-level 7

# Drop Every Connection Except the Above Rules

iptables -A INPUT -j DROP


------------------------x--------------------x-----------------------

#saving the iptables 

#sudo apt-get install iptables-persistent
#sudo service iptables-persistent save
#sudo service iptables-persistent restart

------------------------x--------------------x-----------------------
exit
```
