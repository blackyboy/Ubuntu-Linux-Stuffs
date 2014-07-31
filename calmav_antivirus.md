#### How to Install ClamAV and Configure Daily Scanning in CentOS 6.5

* Enable epel Repository


```
https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

* Install the clamav Package using 

```
# yum install clamav clamd
```

* Start the clamav Service using 


```
# /etc/init.d/clamd start
# chkconfig clamd on
```

* Update the Clamav Signatures using:


```
/usr/bin/freshclam
``` 

* Create a Cronjob for dailyscan for Clamav Using


```
# vim /etc/cron.daily/clamscan_schedule_scan
```

* Add the Script in Created Cron Schedule by replacing which Directory need to scan


```
#!/bin/bash
SCAN_DIR="/home/sysadmin"
LOG_FILE="/var/log/clamav/clamscan_schedule.log"
/usr/bin/clamscan -i -r $SCAN_DIR >> $LOG_FILE
```

* Or Use method:2 By Creating a Cronjob like below:


```
# crontab -e
```

* Append the Fowllowing content


```
00 10 * * * /usr/bin/clamscan -i -r --bell /home/sysadmin >> /var/log/clamav/clamscan_schedule.log
```



