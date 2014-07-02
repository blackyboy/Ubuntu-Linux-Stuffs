#### Logout SSH Users if idle for some time


* Create a file in 


```
# vim /etc/profile.d/autologout.sh
```

* Append the following content 

```
TMOUT=300
readonly TMOUT
export TMOUT
```

* Change the permission for the file 

```
# chmod 644 /etc/profile.d/autologout.sh
```

* Create Other file 

```
# vim /etc/profile.d/autologout.csh
```

* Append the following content 

```
set -r autologout 5
```

* Change the permission for the file


```
# chmod 644 /etc/profile.d/autologout.csh
```

* Deploy the Logout action in sshd config


```
# vim /etc/ssh/sshd config
```

* Append the following content 

``
ClientAliveInterval 300
ClientAliveCountMax 0
```

* Restart the service 

```
# service sshd restart
```
