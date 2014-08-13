#### Enabling Hibernate in Ubuntu 14.04 LTS


* Check hibernate working in your desktop using 


```
# sudo pm-hibernate
```


* Create the file under 


```
# sudo vim /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
```

* Append the following content 


```
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate
ResultActive=yes
```

* Restart the session Using


```
# sudo killall indicator-session-service
```

Now we can Hibernate our system and get boot for later.
