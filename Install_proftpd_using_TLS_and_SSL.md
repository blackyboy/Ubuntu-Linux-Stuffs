#### Install proftpd using TLS/SSL

* Install the openssl package to create certificate files

```
# sudo apt-get install openssl -y
```

* Install the proftpd package using 


```
# sudo apt-get install proftpd -y
```

* Create the certificate file using 


```
# sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/proftpd.pem -out /etc/ssl/proftpd.pem
```

* Change the permission for the certificate file Only read/write for Root user


```
# sudo chmod 600 proftpd.pem 
```

* In Line 138 uncomment


```
# Include /etc/proftpd/tls.conf
```

* Change 

```
# ServerType	standalone
```

* Check for the following contents and change according to our need


```
TLSEngine                               on
TLSLog                                  /var/log/proftpd/tls.log
TLSProtocol                             SSLv23
TLSRSACertificateFile                   /etc/ssl/proftpd.pem
TLSRSACertificateKeyFile                /etc/ssl/proftpd.pem
TLSOptions				NoCertRequest
TLSVerifyClient                         off
TLSRequired                             on
TLSRenegotiate                          required off
```

* Check the Syntax error using 

```
sudo proftpd -t
```

* Restart the server to service get activated

```
# sudo init 6
```


