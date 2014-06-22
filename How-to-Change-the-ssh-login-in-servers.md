#### Here we can see how to change the ssh log in Port and Restrict some Privileges 


1 . first we need to change the port of ssh by using 


```

# sudo vim/etc/ssh/sshd_config


```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20ssh%20login%20Port/Selection_001.png)



2. Then Edit the Port 22 to 2002 (Here im using the port as 2002)
   (In Line Number 5 )


```

# Port 2002


```



![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20ssh%20login%20Port/Selection_002.png)



3. Then Change the settings for grace time and Root Log in Restriction 
   (In Line number 26 & 27 )


```

# 25  Authentication:
# 26 LoginGraceTime 30
# 27 PermitRootLogin no


```


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20ssh%20login%20Port/Selection_003.png)



4. The Restart the SSH Service by using command 


```

# sudo /etc/init.d/ssh restart 


```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20ssh%20login%20Port/Selection_004.png)



5. Then Try to Log in from Other Machine using the IP and Port Number Mentioned as Below



```

# ssh sysadmin@192.168.1.84 -p 2002


```



![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20ssh%20login%20Port/Selection_005.png)




