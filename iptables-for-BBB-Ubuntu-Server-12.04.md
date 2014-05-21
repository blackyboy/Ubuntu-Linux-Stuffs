This Script used for iptables for BBB ubuntu server 12.04

```
#!/bin/bash
#This Script was Used for Only Setting up Iptables in ubuntu 12.04 server
#uncomment the Lines With # Which u don't need to use 
#if u going to use this script in remote VPS Test it in local systems before applying it in remote VPS .


#1.This enable traffic for (lo) loopback interface(-i)


iptables -A INPUT -i lo -j ACCEPT


#2.This Will Keep the rules for Which service currently Established  eg : ssh


iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


#3. This Will Enable the Port Number 2002 for ssh which i we have defined 



iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2002 -j ACCEPT



#4. This Will Enable the Port Number 80 for http 



iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT



#5. This Will Enable the Port Number 443 for httpd 



iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT



#6.This Will Enable the Port Number 9125 for tcp messaging 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 9123 -j ACCEPT


#7. This Will Enable the port Number 1935 for Messaging Service 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 1935 -j ACCEPT


#8. This Will Protect from Dos Attack 


iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT


#9. This will Open the port for the Monit monitoring service over the remote location 


iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2812 -j ACCEPT


#10. If we Need to Disable The ping Request use this Rule


iptables -A OUTPUT -p icmp --icmp-type 8 -j DROP


exit 0
```


To Save the Iptables and Restart follow the Steps 


Installing iptables persistent 


```
# sudo apt-get install iptables-persistent 

```

Give the Yes to IPV4 and IPV6

Save the iptables using command 


```
# iptables-save

```

Save the iptables after reboot 


```

#sudo iptables-persistent save 

```


Restart the iptables to take effect 


```

#sudo iptables-persistent restart

```


Listing the iptables using 


```

#iptables -L

```


For Removing all Rules Use command 


```

#iptables -F

```


To Delete the iptables use command 


```
#iptables -D INPUT 1 (ot) Which Line u need to delete .

```

-----------------------x-------------------x--------------------x---------------
