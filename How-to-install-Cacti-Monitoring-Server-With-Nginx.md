How to install cacti With Nginx 


Cacti provides an exceptionally easy to use system monitoring solution.  Essential graphs are included by default, such as load average and memory usage.


Wee Need to install MYSQL and Nginx For Cacti Monitoring tool

0. Installing Nginx 

```

# sudo apt-get install nginx

```



![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_001.png)



1.Install SNMPD Service 



```

# sudo apt-get install snmpd


```


2.Configure SNMPD



```

# vim /etc/default/snmpd


```


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_002.png)


Relace the Line #export MIBS=/usr/share/mibs/netsnmp/ With 



```

# export MIBS=ALL

```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_004.png)


Then add the Following Line to the ACCESS CONTROL Area of 
/etc/snmp/snmpd.conf




![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_005.png)



```

# rocommunity public localhost       #  Full access from localhost


```


![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_006.png)



Download Non-free MIB Files 


```

# sudo apt-get install snmp-mibs-downloader
# sudo service snmpd restart  

```


![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_007.png)



And Restart the Service 


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_008.png)


Install Cacti And Spine 



```

# sudo apt-get install cacti cacti-spine


```


![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_009.png)


During the installation of Cacti, you will be asked if you’d like dbconfig-common to setup MySQL for Cacti automatically.  This creates a user and database for Cacti, and then imports the necessary data.



![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_010.png)




![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_011.png)




![12](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_012.png)



Add a Symbolic Link to Cacti's Web Interface 


Here i have choosed the location in /var/www/


```

# cd /var/www/


```


![13](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_013.png)




Create a Symbolic link from /usr/share/cacti/site to www


```

# ln -s /usr/share/cacti/site cacti


```



![14](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_014.png)



If we choose other folder cacti to RUN for ex: /var/cacti

We Need to Chown the folder as www-data, But here i used /var/www already Setted as a www-data

If u use /var/cacti chown it using command


```

# sudo chown -R www-data:www-data /var/cacti

```


3 Step we need to Do Here is 


```

Change directory to the root of our site
Create a symbolic link to Cacti’s web interface named cacti
Optional Change owner and group of Cacti’s web interface to www-data


```


Fireup the Browser and Navigate to install cacti from ip were we installed 



```


# http://192.168.122.3/cacti/


```


![15](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_015.png)




![16](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_016.png)


```

User Name : admin
Password  : admin

```


![17](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_017.png)


While Login in it as u to change the password at first Login Choose Your New Password 


![18](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_018.png)



![20](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20Cacti%20With%20Nginx/Selection_020.png)



Default Username and Password is 


```

User Name : admin
Password  : admin

```

