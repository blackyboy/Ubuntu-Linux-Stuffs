This will do incremental backup for user sukumar to samba Drive /sukumar/rsync
His files in Home Directory,Desktop , Pictures, music will be synced using incremental to samba.

Create a Password less Authentication Using 

```
ssh-keygen 
```
Copy the ID using 

```
ssh-copy-id sysadmin@192.168.0.15
```

Create a Script 

```
# vim /home/sysadmin/backup.sh
```

Enter the below script in create file then save and exit

```
#!/bin/bash
rsync -avz --progress --delete --log-file=/tmp/$(date +%Y%m%d-%H%M%S)_rsync.log --exclude samba backup.sh /home/sysadmin/ sysadmin@192.168.0.15:/home/sysadmin/sukumar/rsync/
```
Change the permission of file using chmod

```
chmod 755 backup.sh
```

Add the script file to cronjob for time base execution

crontab -e

```
MAILTO=babin@arrivusystems.com
30 11 * * * sh /home/sysadmin/backup.sh
30 17 * * * sh /home/sysadmin/backup.sh
```

If we need to check.. just Execute the command 

```
sh /home/sysadmin/backup.sh
```

This will backup home Directory into samba Directory were we need.