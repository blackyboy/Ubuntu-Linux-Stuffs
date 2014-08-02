#### Install vsftpd using SSL/TLS


* Install the package vsftpd using:

```
# sudo apt-get install vsftpd
```

* Then install the openssl package


```
# sudo apt-get install openssl
```


* Navigate to ssl directory to create certificate files


```
# sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/vsftpd.pem -out /etc/ssl/vsftpd.pem
```

* Then change the Permission for certificate file only to root user


```
# sudo chmod 600 vsftpd.pem
```

* Edit the vsftpd configuration using 


```
# sudo vim /etc/vsftpd.conf
```

Change the location of certificate file under


```
# rsa_cert_file=/etc/ssl/vsftpd.pem
# rsa_private_key_file=/etc/ssl/vsftpd.pem
```

* Then enable the ssl for vsftpd and force local user to use ssl


```
# ssl_enable=yes
# force_local_data_ssl=YES
# force_local_logins_ssl=YES
# pam_service_name=vsftpd
```

* Restart the vsftpd service and login from filezilla


```
# sudo service vsftpd restart
```

