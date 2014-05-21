Allowing Incoming Traffic on Specific Ports 


Syntax : 

iptables

 
-A INPUT 	   = Append this rules to input chain


-p tcp   	   = Check to see if it is TCP  
  
 
-m state --state   = Allow filter rules to match based on connection state. Permits the use of the --ctstate option.


NEW  		   = NEW - The connection has not yet been seen.


-m tcp             = limit - Require the rule to match only a limited number of times. Allows the use of the --limit option. Useful for limiting logging rules.


--dport 	   = if so, check to see if the input goes to the SSH port (--dport ssh).

80 		   = Port

-j 		   =  Jump to the specified target. By default, iptables allows four targets: 

ACCEPT		   =  if so, accept the input (-j ACCEPT).

	 
This will Open the Port Number 80, 443, 9123, 1935

```

iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 9123 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 1935 -j ACCEPT


```

Allowing Established Sessions


```

# sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


```


1. The above rule has no spaces either side of the comma in ESTABLISHED,RELATED
If the line above doesn't work, you may be on a castrated VPS whose provider has not made available the extension, in which case an inferior version can be used as last resort:


```

sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


```


Blocking Traffic



```

sudo iptables -A INPUT -j DROP


```

