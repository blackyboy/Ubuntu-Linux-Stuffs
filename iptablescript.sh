#!/bin/bash 

#This Script was Used for Only Setting up Iptables in ubuntu 12.04 server
#uncomment the Lines With # Which u don't need to use 
#if u going to use this script in remote VPS Test it in local systems before applying it in remote VPS .
#final line will be commented with # cos it will save the iptables if its not commented with #
#while saving Write the file to /etc/network/iptables.rules 
#For Bringing Up the iptables after reboot entry want to be added in /etc/network/interface at last line 


#1. Delete all Existing Rules 


iptables -F


#2. Set Default Chain Ploicies 


#iptables -P INPUT DROP
#iptables -P FORWARD DROP
#iptables -P OUTPUT DROP


#3.This enable traffic for (lo) loopback interface(-i) 


iptables -A INPUT -i lo -j ACCEPT


#4. This Will Keep the rules for Which service currently Established  eg : ssh


iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


#5. This Will Enable the Port Number 2002 for ssh which i we have defined 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2002 -j ACCEPT


#6. This Will Enable the Port Number 80 for http 

 
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT


#7. This Will Enable the Port Number 443 for httpd 

 
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT


#8. This Will Enable the Port Number 9125 for tcp messaging 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 9123 -j ACCEPT


#9. This Will Enable the port Number 1935 for Messaging Service 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 1935 -j ACCEPT


#10. This will Enable the Port for Monit Monitoring Software from remote location


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2812 -j ACCEPT


#11. This will enable the ping( currently we Dont need ) 


#iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT


#12. This Will Protect from Dos Attack 


iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT


#13. If There is a Static IP For Our Own this rule can be used if not avoid it .



#iptables -A INPUT -p tcp -i eth0 --dport 2002 --sport 1024:65535 -s <ip address of your remote machine > -m conntrack --ctstate NEW -j ACCEPT



#14. If we Need to Disable The ping Request use this Rule


iptables -A OUTPUT -p icmp --icmp-type 8 -j DROP


# 15. Allow rsync from a specific network


iptables -A INPUT -i eth0 -p tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT


iptables -A OUTPUT -o eth0 -p tcp --sport 873 -m state --state ESTABLISHED -j ACCEPT


# 16. Collecting Log for dropped packets


iptables -N LOGGING

iptables -A INPUT -j LOGGING

iptables -A LOGGING -m limit --limit 30/min -j LOG --log-prefix "IPTables Packet Dropped: " --log-level 7


#17. What ever Connections Except Above this command Will Work and After this Command There is no execution 


iptables -A INPUT -j DROP



#18. Write the Rules what ever saving in iptables Will be Stored here for getting act after a Reboot 


#iptables-save > /etc/iptables.up.rules


#19. This will Write the Entry in /etc/network/interfaces


#echo "pre-up iptables-restore /etc/network/iptables.rules" >> /etc/network/interfaces



