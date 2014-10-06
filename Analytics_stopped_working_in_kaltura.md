analytics stopped working

https://github.com/kaltura/platform-install-packages/issues/94

Issue because of Most probably a lock got stuck.

```
# mysql -u root -p
```

```
mysql> use kalturadw_ds


select * from locks;


update locks set lock_state=0;

\q
```

Then navigate to the below directory and run the scripts


```
# cd /etc/cron.d/

# cat kaltura-dwh
```

Run every scripts to update the analytics


