#### Install Dell OMSA Server Management in Centos

* This setup instruction works with RHEL5, RHEL6, Centos.

* Set up the Dell OpenManage Repository at http://linux.dell.com/repo/hardware


```
wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash
```

* Install OpenManage Server Administrator (OMSA) Using following command


```
yum install srvadmin-all
```

* The Above Command will install the following packages, Install defualt location will be under /opt/dell/srvadmin


```
srvadmin-all: Install all OMSA components
srvadmin-base: Install only base OMSA, no web server
srvadmin-webserver: Install Web Interface
srvadmin-storageservices: Install RAID Management
srvadmin-rac4: Install components to manage the Dell Remote Access Card 4
srvadmin-rac5: Install components to manage the Dell Remote Access Card 5
```

* Create a softlink for service under /etc/init.d/


```
ln -s /opt/dell/srvadmin/sbin/srvadmin-services.sh srvadmin
```

* Start the Service


```
Service srvadmin start
```

* Navigate to the any Browser and open access the OMSA


```
https://192.168.1.15:1311
```


* Login using the Username and password of root to manage the server


```
root 
admin123$
```


