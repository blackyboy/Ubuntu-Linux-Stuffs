#### IPtables for Squid Proxy Using 2 Ethernet Card's

```
#! /bin/sh
#just for the sake of turning the networks off and on... not sure if it would work turning them back on only at the end of script ?
ifconfig eth0 down;
ifconfig eth1 down;
ifconfig lo down;
ifconfig lo up;
ifconfig eth0 up;
ifconfig eth1 up;
ifup eth0;
ifup eth1;
#I seemed to have some issues with the routing table so i thought I throw in a check up :
route add 127.0.0.1 dev lo;
route add -net 127.0.0.0/8 dev lo;
route add -net 192.168.0.0/24 dev eth1;
route add 192.168.1.0 dev eth0;
route add default gw 192.168.1.1;
# turn fowarding off while configuring iptables :
sysctl net/ipv4/ip_forward=0
iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD ACCEPT
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
#And on again once the policies are set
sysctl net/ipv4/ip_forward=1
#redirect port 80 on lan card and masquerade on wan card :
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port 3128
#accept all packets in lo and protect against spoofing :
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i !lo -s 127.0.0.0/8 -j DROP
iptables -A FORWARD -i !lo -s 127.0.0.0/8 -j DROP
#accept only established input but all output on WAN card
iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
#just forget the invalid packets :
iptables -A OUTPUT -o eth0 -m state --state INVALID -j DROP
iptables -A INPUT -i eth0 -m state --state INVALID -j DROP
#not sure whether to put this before or after spoofing protection ?
iptables -A INPUT -i eth1 -j ACCEPT
iptables -A OUTPUT -o eth1 -j ACCEPT
#against spoofing on LAN card input :
iptables -A INPUT -i !eth1 -s 192.168.0.0/24 -j DROP
iptables -A FORWARD -i !eth1 -s 192.168.0.0/24 -j DROP
```
-----------------x------------------x-----------------
o Save the Iptables and Restart follow the Steps 


Installing iptables persistent 



```
#sudo apt-get install iptables-persistent 


```

Give the Yes to IPV4 and IPV6

Save the iptables using command 


```
# iptables-save

```

Save the iptables after reboot 


```
#sudo service iptables-persistent save 

```

Restart the iptables to take effect 


```
#sudo service iptables-persistent restart

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
