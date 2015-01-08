#### Secure webpage using htaccess.

Edit the file and change none to all under AllowOverride.

```
# sudo vim /etc/apache2/sites-available/default
```

* Change the none to all

```
<Directory /var/www/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride all
        Order allow,deny
        allow from all
</Directory>
```

* Reload the config using

```
# sudo /etc/init.d/apache2 reload
```

* Protect the directory with password:

If i need to protect the /var/www/html/my-domain/ with a password have to create a .htaccess file under the /var/www/html/my-domain/.


```
# sudo vim /var/www/html/my-domain/.htaccess
```

* Then append the below content and change the AuthuserFile location to were we going to save the password file for htaccess. Here i have choose the /usr/local/secure location to create and save the file in next step.

```
AuthUserFile /usr/local/secure/.htpasswd
AuthName "Authorization Required"
AuthType Basic
require valid-user
```

* Create the password file using for htaccess with a user, Here i have used webadmin_user.


```
# htpasswd -c /usr/local/secure/.htpasswd webadmin_user
```

* Then add the htaccess location to apache2.conf

```
# sudo vim /etc/apache2/apache2.conf
```

* Add the below directory tagging to virtualhost.

```
<Directory /your/path>
AllowOverride All
</Directory>
```

* Restart the apache service using

```
# sudo /etc/init.d/apache2 restart
```

Now we have secured our page with a password.
