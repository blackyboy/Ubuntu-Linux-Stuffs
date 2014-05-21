Here we can see how to create a backup using TAR

Switch to Privileged user first 

```

 sudo su

```

Come to root / Directory 

```

 cd /

```

This Command will backup Whole system by excluding some Directory 

```

 tar cvpzf backup.tar.gz --exclude=/proc --exclude=/lost+found --exclude=/backup.tar.gz --exclude=/mnt --exclude=/sys /

```

To restore The Backup 

```

 tar xvpfz backup.tar.gz -C /

```


***


To Split the Archive while creating 

```

 tar -cvpz <put options here> / | split -d -b 3900m - /name/of/backup.tar.gz

```

To Split the archive after creation 

```

 split -d -b 3900m /path/to/backup.tar.gz /name/of/backup.tar.gz

```

***

Backup Over Network 


Here we can Backup the Whole System to other system in a Network 

In Receiving system we have to configure this for receiving the backup and the port we can use as wish


```

 nc -l 1024 > backup.tar.gz

```

In Sending Computer we have to create it and send it via nc as

```

 tar -cvpz <all those other options like above> / | nc -q 0 <receiving host> 1024

```

If we use ssh use the following command 

```

 tar -cvpz <all those other options like above> / | ssh <backuphost> "( cat > ssh_backup.tar.gz )"


```

Restoring Over Network 


This command want to used in a Receiving computer 

```

nc -l 1024 | sudo tar -xvpzf - -C /media/whatever 

```

This want to be in a sending computer 


```

 cat backup.tar.gz | nc -q 0 <receiving host> 1024  

```


***


Restoring GRUB

```

sudo -s
for f in dev dev/pts proc ; do mount --bind /$f /media/whatever/$f ; done
chroot /media/whatever
dpkg-reconfigure grub-pc


```