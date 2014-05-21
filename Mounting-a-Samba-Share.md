To Mount a Samba Share Permently in client machines 

```

#sudo mkdir /home/sysadmin/public

#apt-get install smbfs

#sudo mount -t cifs //192.168.1.15/public /home/sysadmin/public

Fstab Entry For Mount point 

#//192.168.1.15/public /home/sysadmin/public     cifs    username=sysadmin,password=admin123$,_netdev    0       0

```