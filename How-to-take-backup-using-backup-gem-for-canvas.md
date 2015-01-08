How to take backup using backup gem for canvas

To install backupgem

```
# sudo gem install backup
```

Then to Create the config.rb file for backup gem

```
# backup generate:config

```

New here in home directory there will be a file created under 

```
/home/sysadmin/Backup/config/config.rb
```

Then if we need to take the backup for files, database, queue production db 
use the following command to create the model file

```
# backup generate:model --trigger production_database_name_here --databases="postgresql" --archives --compressor="gzip" --notifiers="mail"
```

Edit the files under Backup/config/ and make changes.


Check for the Configuration Error Using following commans when your in config file Directory

```
backup check
```

To Manually take backup


```
backup perform -t production_database_name_here
```

Then we need to Automate the Backup Using whenever gem

Install the Whenever Gem Using


```
# sudo gem install whenever
```

Configure the whenever gem,
first we need to create a directory named Backup

```
# mkdir config && cd ~/home/sysadmin/Backup/config
```
Then Run the command wheneverize to get create the schedule.rb file under /home/sysadmin/Backup/config

```
wheneverize
```

Add the content to get effect 

```
every 1.day, :at => '3:00 am' do

   command "/usr/local/bin/backup perform -t database --config-file /root/Backup/config.rb"
   command "/usr/local/bin/backup perform -t file_backup --config-file /root/Backup/config.rb"
 end
```

Add the Schedule to crontab using

```
whenever -w ~/Backup/config/schedule.rb
```

Then Update the Crontab using following command,

```
whenever --update-crontab

````

Thats's it
