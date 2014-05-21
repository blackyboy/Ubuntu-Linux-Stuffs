How to install vsftpd for a Local user in ubuntu 12.04 server


vsftpd is the more secured ftp server 


1. Add a User for ftp access 


```

#useradd -m -s /bin/bash babin

#passwd babin


```


-m will create home directory for babin

-s will add the user in /bin/bash shell 



![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_005.png)



2. First we need to install vsftpd 


```

# apt-get install vsftpd 


```



![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_001.png)



note : if the service auntomatically runs after installation we need to stop if not skip the step 2 and 3 



3. Then install stop the service of vsftpd using command 


```

# sudo invoke-rc.d vsftpd stop

    or 

# sudo /etc/init.d/vsftpd stop


```


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_003.png)



4. After Stoping the service check Weather its running or Not using command 


```


# netstat -ntl | grep 21
           or
# netstat -ntl | grep vsftpd 


```


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_002.png)



5. Then Edit the configuration file of vsftpd 


```

# sudo vim /etc/vsftpd.conf


```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_004.png)



6. uncomment the Following lines and Change the value asper your need (Line numbers Mentioned)


```


#14 listen=YES
#23 anonymous_enable=NO
#26 local_enable=YES
#29 write_enable=YES
#33 local_umask=022
#38 anon_upload_enable=NO
#42 anon_mkdir_write_enable=NO
#75 idle_session_timeout=120
#78 data_connection_timeout=120
#112 chroot_local_user=YES


```

If we need to liseten in differnet port number it need to mentioned here (Default Will be 20)


```

#58 connect_from_port_20=YES


```

7. Start the vsftpd service 


```

# sudo invoke-rc.d vsftpd start


```


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_008.png)


8. Check the Service status by 


```

# netstat -ntl | grep 21


```

9. Login from filezilla client or check from ftp CLI 




![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_010.png)




Output :



```

lonston@desktop:~$ ftp 192.168.122.38
Connected to 192.168.122.38.
220 (vsFTPd 2.3.5)
Name (192.168.122.38:lonston): babin
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> !ls
Desktop    examples.desktop  libpeerconnection.log  Public	Videos
Documents  Git		     Music		    Templates
Downloads  GNUstep	     Pictures		    Ubuntu One
ftp> lcd 
Local directory now /home/lonston
ftp> pwd
257 "/"
ftp> !pwd
/home/lonston
ftp> bye
221 Goodbye.

```


![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_011.png)




Very important Note : If its browseable to all Direcorty from users home ot / , then we need to jail the user to its Own home directory for that we have to do 

```

# chmod a-w /home/babin


```


![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/vsftpd%20in%20ubuntu%20server%2012.04/Selection_009.png)



If so ftp user can't access any files Except his Home Directory ...


