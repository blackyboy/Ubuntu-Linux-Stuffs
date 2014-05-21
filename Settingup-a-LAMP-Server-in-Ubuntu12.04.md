Settingup a LAMP Server in Ubuntu12.04


Installing Apache2,PHP5 & MySQL On Ubuntu12.04 LTS For Settingup a LAMP Server 

LAMP = Linux, Apache, Mysql, PHP 


For Installing this stuff u need root privilage 
So Switch to Root User using 



```

# sudo su


```


Then update the server using command 


```
# sudo apt-get update 

```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_001.png)


Installing MYSQL5 



```

# apt-get install mysql-server mysql-client


```



![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_002.png)



It will ask for Password give the password of root
Here im using root and password as sysadmin123


```

# New password for the MySQL "root" user : password
# Repeat password for the MySQL "root" user: password


```



Installing Apache2

Apache2 Will install as Default from Ubuntu if not we need to install using command 



```

# apt-get install apache2


```


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_003.png)



Navigate to the IP address were u have installed the apache 
Here im using IP 192.168.122.69


```
As im loading it from Web Browser as http://192.168.122.69

```


If it Installed and apache running we can see like this as Shown in the below image 



![16](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_016.png)



Installing PHP5 


Now we need to install PHP5 and the Apache php5 Module by using command

 


```

# apt-get install php5 libapache2-mod-php5


```



![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_004.png)




Then Restart the Apache to take effect and check weather there is any Error Messages ...



```

# /etc/init.d/apache2 restart


```


![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_005.png)



Testing PHP5 And Gathering Info About PHP5 Installation
Create a info file under www


```

# vi /var/www/info.php


```


![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_006.png)



And in that Created file Enter the info For PHP


`
<?php
phpinfo();
?>
`


Now save the file and Navigate to the web Browser and openup the Page mentioning the IP 


```
http://192.168.122.69/info.php

```


As we see here PHP5 is Working to confirm Check the Line { Apache 2.0 Handler , in Server API }




![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_007.png)




Getting MYSQL Support in PHP5 



To Collabrate Mysql with PHP we have to install php5 modules



```

# apt-cache search php5

# apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

```



![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_009.png)



Then Restart the apache2 


```

/etc/init.d/apache2 restart


```



![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_010.png)



Now Reload the Browser using {http://192.168.122.69/info.php} and verfiy the setting under Mysql Topic As Shown in the below Image 



![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_011.png)



Install phpmyadmin


```

# apt-get install phpmyadmin


```


![12](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_012.png)



While installation it will ask for some settings for choosing apache server or lighthttpd choosem apache 




```
Choose Apache 

Choose no for dbconfig-common 

```


Here its show in the Below images 




![13](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_013.png)




![14](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_014.png)



Now Navigate to the Web Browser and openup the IP mentioned with /phpmyadmin/


```

# http://192.168.122.69/phpmyadmin/


```

Login Information here im used is root = admin123


Here in Below image u can see the phpmyadmin page i have logined 



![15](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20LAMP%20server%20/Selection_015.png)



Thats it a LAMP server Have been Installed and configured Successfully ... 


For One Click Installation Use the command 


```

# sudo apt-get install lamp-server^ phpmyadmin

```


