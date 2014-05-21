### Log Rotation

Log rotation is an automated process used in system administration in which dated log files are archived. In general, it is used on servers. Servers which run large applications, such as LAMP stacks, often log every request, and as such, the process of log rotation may be beneficial.

### Files and Directories used by Logrotate

Configuration file will be Under

```
/etc/logrotate.conf
```

Information about last log rotate

```
/var/lib/logrotate.status    or    /var/lib/logrotate/status
```

### The directory thats usually used by logrotate is

```
/etc/logrotate.d
```

Add the following line in /etc/logrotate.conf 

```
include /etc/logrotate.d
```

### Log rotating nginx
Nginx Log-rotate Configuration 

```
#vim /etc/logrotate.d/nginx
```
Enter the Below Script 

```
/var/log/nginx/*.log {
daily
missingok
rotate 52
compress
delaycompress
notifempty
create 0640 www-data adm
sharedscripts
prerotate
   if [ -d /etc/logrotate.d/httpd-prerotate ]; then \
   run-parts /etc/logrotate.d/httpd-prerotate; \
   fi; \
endscript
postrotate
  [ ! -f /var/run/nginx.pid ] || kill -USR1 `cat /var/run/nginx.pid`
endscript
}
```
### Rails log rotate

```
/var/capistrano/deploy/sublime_hiring/current/log/*.log {
daily
missingok
rotate 30
compress
delaycompress
notifempty
copytruncate
}
```

### Understanding the Options

* daily – Rotate the log files each day. You can also use weekly or monthly here instead.
* missingok – If the log file doesn’t exist, ignore it
* rotate 7 – Only keep 7 days of logs around
* compress – GZip the log file on rotation
* delaycompress – Rotate the file one day, then compress it the next day so we can be sure that it won’t interfere with the Rails server
* notifempty – Don’t rotate the file if the logs are empty
* copytruncate – Copy the log file and then empties it. This makes sure that the log file Rails is writing to always exists so you won’t get problems because the file does not actually change. If you don’t use this, you would need to restart your Rails application each time.

### To manually run logrotate :

```
sudo logrotate -f -v /etc/logrotate.d/nginx

```