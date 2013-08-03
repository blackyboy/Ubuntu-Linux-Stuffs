
To Save the Iptables and Restart follow the Steps 


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
