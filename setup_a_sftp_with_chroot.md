#### How to setup a sftp with chroot


* first add a group 

```
# groupadd secure_ftp
```

* Add the user to newly created Group


```
# usermod -G secure_ftp sysadmin
```

* Edit the ssh configuration file under


```
# vim /etc/ssh/sshd_config
```

* Comment the following line to add a new line below that


```
#Subsystem sftp /usr/lib/openssh/sftp-server
```

* Add this line below the commented line above


```
# Subsystem sftp internal-sftp
```

* Append the following at the end of file


```
Match Group secure_ftp
x11Forwarding no
AllowTcpForwarding no
ChrootDirectory /home
ForceCommand internal-sftp
```

* Restart the ssh service 


```
# sudo service ssh restart
```

* Now login from CLient machines


```
# sftp sysadmin@192.168.1.200
```

This will work using default ssh..
