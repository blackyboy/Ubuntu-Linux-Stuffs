#### Install and Configure Logwatch in Ubuntu-Server

* Install Logwatch using 


```
# sudo apt-get install logwatch
```

* Edit logwatch.conf file


```
#  /usr/share/logwatch/default.conf/logwatch.conf
```

* Change the following:


```
# Output = mail
# Format = html
# MailTo = blackyboy@github.com
```

Save and Exit

* Edit the file 00logwatch to append the mail were we need to get the Logs


```
# /etc/cron.daily/00logwatch
```

* Add the following line.


```
# /usr/sbin/logwatch --mailto blackyboy@github.com
# /usr/sbin/logwatch --mailto logwatcher@live.com
```

Save and exit.

* Test the Logwatch using command 

```
# logwatch
```

* If we need get log in specific time add in cronjob as below

Create a Cronjob using 

```
crontab -e
```

Append the Below Content

```
# m h dom mon dow   command
0 10  * * *          /usr/sbin/logwatch
```

That's it we have done.
