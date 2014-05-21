Here we can see how to restrict the brute force attack d dosattack and etc by installing and configuring fail2ban

First we need to install fail2ban by using 

```

#apt-get install fail2ban 


```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_001.png)



Move the file jail.conf to the same location as jail.local


```


# mv /etc/fail2ban/jail.conf /etc/fail2ban/jail.local



```


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_002.png)




![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_003.png)




Change the Configuration to below as mentioned 


```

[DEFAULT]

# "ignoreip" can be an IP address, a CIDR mask or a DNS host
ignoreip = 192.168.1.77
bantime  = 600
maxretry = 2

```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_004.png)




Here 192.168.1.77 is the Ip were  i have installed fail2ban and want to get protected 

Bantime set for 10 min

maximum try for login 2 times 


 

This want to be Enabled

```

backend = auto

```

```

# [SECTION_NAME]
 enabled = true

#
 in /etc/fail2ban/jail.local.

```


![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_005.png)




Check the ssh for Protection 




```

[ssh]

enabled  = true
port     = 2002
filter   = sshd
logpath  = /var/log/auth.log
maxretry = 3


```


![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_006.png)



Here if we need to enable the service for ssh we need to change it to true 
And the Port number is 2002 for ssh in my system for testing 
filter want to be sshd 
max try is 3 times if not it will block and give us log 

thats it 


If we need to add service for more like this ddos attack or what ever we can add it 



![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Fail2ban/Selection_007.png)



