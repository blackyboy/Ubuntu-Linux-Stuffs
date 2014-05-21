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

Enter the Below Content to the bottom of the config.rb file

```
# Load all models from the models directory.
Dir[File.join(File.dirname(Config.config_file), "models", "*.rb")].each do |model|
  instance_eval(File.read(model))
end
       
```

Then if we need to take the backup for files, database, queue production db 
use the following command to create the model file

```
# backup generate:model --trigger production_database_name_here \
    --databases="postgresql" --archives --compressor="gzip" --notifiers="mail"
```

In Created files add the following 


```
# Archive [Archive]
# https://github.com/meskyanichi/backup/wiki/Archives

archive :my_archive do |archive|

# Run the `tar` command using `sudo`
# archive.use_sudo
# archive.add "/path/to/a/file.rb"

archive.add "~/rails/"
end
```

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
every :hour do

  command "backup perform -t production_database_name_here"
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