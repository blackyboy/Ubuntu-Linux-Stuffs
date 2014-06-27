#### How To Disable Ping Replies in Linux using icmp_echo_ignore_all


You may want to disable ping replies for many reasons, may be for a security reason, or to avoid network congestion.


Someone can flood the network with ping -f, If ping reply is disabled we can avoid this flooding.

Disable ping reply Temporarily

You can temporarily disable the ping reply using the following method.

```

# echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all


```

This is a not permenant Diable , if we restart the System it will be erased  to permently Save settings Use other method 


To enable back the Ping reply , set the value to '0'

```

#echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all

```


Disable Ping reply Permanently 

You can Permanently disable the ping reply using the following method .

Step 1 : Edit the sysctl.conf file and add the follwing line 


```

#net.ipv4.icmp_echo_ignore_all =1 

```

Step 2 : 

Execute sysctl -p to enforce this setting immediately 


```

#sysctl -p


```


The above Commands Loads the sysctl settings from the sysctl.conf file 




