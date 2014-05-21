Note :> Here im using IP 192.168.122.239 for my server 


First we need to install Apache Web server if its not installed 


```

# sudo apt-get install apache2

```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_001.png)


To Enable SSL We need to Enable Module First 


```

# a2enmod ssl


```



![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_002.png)



Then Create a Directory Under Apache2 Dir


```

# mkdir /etc/apache2/ssl

```



![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_003.png)



Install the Openssl and Its Supporting Packages for SSl Cetificate creation 



```

# openssl req -new -x509 -days 365 -nodes -out /etc/apache2/ssl/apache.pem -keyout /etc/apache2/ssl/apache.key


```



It Will as For Some info to add for the Certificate Creation Like country and State 
As Shown Below



```
Generating a 1024 bit RSA private key
....................................++++++
........................................++++++
writing new private key to '/etc/apache2/ssl/apache.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:IN
State or Province Name (full name) [Some-State]:TN
Locality Name (eg, city) []:NGL
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Blablabla
Organizational Unit Name (eg, section) []:IT
Common Name (e.g. server FQDN or YOUR name) []:ubuntutest.example.com
Email Address []:babin@blablabla.com
```

Certificate Created Sucesfully 


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_004.png)




Now we need to Configure the Apache to use self-signed


Edit the file port and enable it for https


```

# /etc/apache2/ports.conf

```



![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_006.png)




Edit the line NameVirtualHost With the Port number 443


```

# NameVirtualHost 192.168.122.239:443

```


![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_007.png)



Navigate to the Directory And Edit the file default 


```

# cd /etc/apache2/sites-available/

# vim default

```


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_008.png)


Enter the Info as Below 


```

<VirtualHost 192.168.122.239:443>
        SSLEngine On
        SSLCertificateFile /etc/apache2/ssl/apache.pem
        SSLCertificateKeyFile /etc/apache2/ssl/apache.key

        ServerAdmin webmaster@localhost
        ServerName ubuntutest.example.com
        DocumentRoot /var/www
        <Directory />


```



![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_009.png)




Then restart the Apache Server 


```

# /etc/init.d/apache2 restart

```



![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_010.png)



Then Openup the browser and Navigate to the IP address With https


```

# https://192.168.122.239/

```


As Show Below u can verifiy the Certificate Issued 




![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_011.png)




After Accepting the Certificate 




![12](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_012.png)



Check the Cetificate Which have been installed 



![13](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/SSL%20Cetificate%20for%20Apache%20/Selection_013.png)



Thats it ...


