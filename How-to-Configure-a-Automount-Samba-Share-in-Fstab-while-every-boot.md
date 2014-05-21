How to Configure a Automount Samba Share in Fstab while every boot

Install the Samba Client pacakge 


```
# sudo apt-get install smbfs

```


Syntax 


```

//server/share /pathto/mountpoint cifs credentials=/home/username/.smbcredentials,uid=shareuser,gid=sharegroup 0 0

```

Edit the /etc/fstab and add your entry




```
//192.168.1.15/public /home/sysadmin/samba cifs credentials=/home/sysadmin/.smbcredentials,uid=sysadmin,gid=sysadmin 0 0

```

Create the .smbcredentials file in your home directory


```

username=shareuser
password=sharepassword
domain=domain_or_workgroupname

```

Make sure you secure your ~/.smbcredentials file:


```
# chmod 0600 ~/.smbcredentials

```

Finally, test the mount with:


```
# sudo mount -a

```


