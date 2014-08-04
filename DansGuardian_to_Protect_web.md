#### DansGuardian to Protect web

DansGuardian is a web content filtering proxy for Linux, NetBSD, FreeBSD, OpenBSD, and Solaris that uses Squid to do all the fetching
It filters using multiple methods. These methods include URL and domain filtering, content phrase filtering, PICS filtering, MIME type filtering, file extension filtering, POST limiting and content AV scanning.


* Install the package using


```
# sudo apt-get install dansguardian
```

* Edit the configuration 


```
# sudo vim /etc/dansguardian/dansguardian.conf
```


* Change the port that DansGuardian listens to if we need to use other than the default port


```
# filterport = 8080
```

* Change the port DansGuardian connects to proxy on


```
# proxyport = 3128
```

* Comment out the this line after making changes
  Use # to comment 

```
#UNCONFIGURED - Please remove this line after configuration
```

* Here we can find many available options to change


```
# cd /etc/dansguardian/lists/
```

* Restart the Service using


```
# sudo service dansguardian restart
```

from client side we have to change the Proxy port in every browser


