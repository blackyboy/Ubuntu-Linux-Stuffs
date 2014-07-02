* First Create a user sysadmin

```
# useradd -m -s /bin/bash sysadmin
```

* Create a password for sysadmin

```
# passwd sysadmin
```

* Add the Created Sysadmin user to Sudo Group to get root privileges

```
# sudo usermod -a -G sudo sysadmin
```

* Change the Port number for ssh

```
# vim /etc/ssh/sshd_config 
```

* Change the Port 22 to some what we which above 2000

```
Port 22
to
Port 2222
```

Note: While Applying iptables Don't forget to Open the port 2222 , If not we will loose the connection, And can't access, But can retrive using Dashboard from Cloud Hosting

```
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2222 -j ACCEPT
```

* Change the LoginGraceTime 120 to some minimum value (Mine is 30)

UnComment 

```
#Banner /etc/issue.net
```

* And Create a file in /etc/issue.net for banner while ssh login 

I use this 

```
###############################################################
#               Authorized access only!                       # 
# Disconnect IMMEDIATELY if you are not an authorized user!!! #
#       All actions Will be monitored and recorded            #
###############################################################
```
Or Use this 

```
NOTICE TO USERS

This computer system is the private property of its owner, whether
individual, corporate or government.  It is for authorized use only.
Users (authorized or unauthorized) have no explicit or implicit
expectation of privacy.

Any or all uses of this system and all files on this system may be
intercepted, monitored, recorded, copied, audited, inspected, and
disclosed to your employer, to authorized site, government, and law
enforcement personnel, as well as authorized officials of government
agencies, both domestic and foreign.

By using this system, the user consents to such interception, monitoring,
recording, copying, auditing, inspection, and disclosure at the
discretion of such personnel or officials.  Unauthorized or improper use
of this system may result in civil and criminal penalties and
administrative or disciplinary action, as appropriate. By continuing to
use this system you indicate your awareness of and consent to these terms
and conditions of use. LOG OFF IMMEDIATELY if you do not agree to the
conditions stated in this warning.

****************************************************************************
```

* Try to login the newly Created sysadmin account from terminal and check

Then edit the 

```
# vim /etc/ssh/sshd_config 
```
And change the 

```
PermitRootLogin yes 

to 

PermitRootLogin no
```

* Add the allowed Users to restirct others


```
AllowUsers user1 user2 user3

```


* Client idle Logout


```
ClientAliveInterval 300
ClientAliveCountMax 0
```

* Limit the amount of unauthenticated SSH connections


```
MaxStartups 2:30:5
```

* Then Restart the ssh service using 

```
# sudo /etc/init.d/ssh restart
```
