#### How to clear the POODLE attack in SSL

Edit the virtualhost under 


```
# vim /etc/nginx/site-available/site
```

Under 

```
# ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
```

We should Disable SSLv3 in NGINX.


```
# ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;  # don’t use SSLv3 ref: POODLE
```

Restart Nginx using 


```
# nginx –s reload

or 

# sudo service nginx restart
```

#### In Apache Server


Edit the file under 

```
# vim /etc/httpd/conf.d/ssl.conf
```

Or add to virtualhost

```
# SSLProtocol all -SSLv3 -SSLv2
```

* Then restart the service using 


```
# sudo service apache2 restart
# sudo service httpd restart
```

* Chiper should use


```
# ssl_ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS;
```

* Config want to be look like this below:


```
ssl on;
ssl_certificate /etc/ssl/STAR_domain_com.pem;
ssl_certificate_key /etc/ssl/domain.com.key;
ssl_protocols    TLSv1 TLSv1.1 TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS;
keepalive_timeout 70;
ssl_session_cache shared:SSL:10m;
ssl_session_timeout 10m;
```

Refernce:> https://scotthelme.co.uk/a-plus-rating-qualys-ssl-test/

