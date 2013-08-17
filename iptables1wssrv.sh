#!/bin/bash 

#This Script was Used for Only Setting up Iptables in ubuntu 12.04 server
#uncomment the Lines With # Which u don't need to use 
#if u going to use this script in remote VPS Test it in local systems before applying it in remote VPS .
#final line will be commented with # cos it will save the iptables if its not commented with #


#0. Flush every Rules what ever there already 

iptables -F

#1. This enable traffic for (lo) loopback interface(-i) 


iptables -A INPUT -i lo -j ACCEPT


#2. This Will Keep the rules for Which service currently Established  eg : ssh


iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


#3. This Will Enable the Port Number 2002 for ssh which i we have defined 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2002 -j ACCEPT


#4.This Will Enable the Port Number 80 for http 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT


#5.This Will Enable the Port Number 443 for httpd 

 
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT


# This Will Enable the port Number 3000 


iptables -I INPUT -p tcp -m state --state NEW -m tcp --dport 3000 -j ACCEPT


#6. This Will Enable Port for postgersql 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 5432 -j ACCEPT


#8. This will Enable the Port for Monit Monitoring Software from remote location


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2812 -j ACCEPT



#9. Allow rsync from a specific network


iptables -A INPUT -i eth0 -p tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT


iptables -A OUTPUT -o eth0 -p tcp --sport 873 -m state --state ESTABLISHED -j ACCEPT


#10. Blow ICMP PING Request 


iptables -A INPUT -p icmp --icmp-type echo-request -j DROP


#11. This Will Block Other connections 


iptables -A INPUT -j DROP



#saving the iptables 


#sudo apt-get install iptables-persistent
#sudo service iptables-persistent save
#sudo service iptables-persistent restart




