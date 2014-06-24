#### How To Install And Configure Apt-Cacher NG On Ubuntu Server 12.04 , 13.04


Apt-cache NG will Store the Packages locally and servers to the Networked Systems 

1. Install the package from apt

```

# apt-get install apt-cacher-ng 


```

Configure the Settings for Cache

Navigate to the configuration file under 

```

# vim /etc/apt-cacher-ng/acng.conf


```

Add the change some contents and some content will be there already 
only need to look at the following contents 


```

#CacheDir: /var/cache/apt-cacher-ng
#LogDir: /var/log/apt-cacher-ng
#Port:3142
#BindAddress: 0.0.0.0
#Remap-debrep: file:deb_mirror*.gz /debian ; file:backends_debian
#Remap-uburep: file:ubuntu_mirrors /ubuntu ; file:backends_ubuntu
#PidFile: /var/run/apt-cacher-ng/pid
#ExTreshold: 4

```

Restart the Apt-cacher NG service by using command 

```

# /etc/init.d/apt-cacher-ng restart


```

the output will be like this 


```
* Restarting apt-cacher-ng apt-cacher-ng                                [ OK ]

```

Then in client Systems :

edit the config file for apt in 


```

# /etc/apt/apt.conf.d/02proxy


```

02proxy file will not be there we have to create it using above command and Entry the below contents 


```

Acquire::http { Proxy "http://192.168.1.99:3142"; };


```

Here after if we install any content will be cached and apt-cache will provide for future uses ..



![Configuration Page of APT Cache](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/%20Apt%20.png)




 
