#### Here we can see How to Install Drupal in ubuntu server's 

First of all we need to install a LAMP server for Drupla installation and we need to Create a Database for Drupa installation 


* First we need to update the Server for Repository Refresh


```
# Sudo apt-get update

```

![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_001.png)


* Then we need to install the apache server


```

# sudo apt-get install apache2


```


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_002.png)


* Then install the Database Engine mysql-server and Php for Drupla 



```
# sudo apt-get install php mysql-server php5-mysqllibapache2-mod-auth-mysql php-mbstring php5-gd

```


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_003.png)


* Once you have installed MySQL, we should activate it with this command



```

# sudo mysql_install_db


```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_004.png)


* Finish up by running the MySQL set the Password for root


```

# sudo /usr/bin/mysql_secure_installation


```


![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_005.png)


* While we Running this it will ask for the root password  to Enter But yet now we not create a password so Just Press ENTER 




```
NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MySQL
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!


In order to log into MySQL to secure it, we'll need the current
password for the root user.  If you've just installed MySQL, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MySQL
root user without the proper authorisation.

You already have a root password set, so you can safely answer 'n'.

Change the root password? [Y/n] y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MySQL installation has an anonymous user, allowing anyone
to log into MySQL without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MySQL comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...



All done!  If you've completed all of the above steps, your MySQL
installation should now be secure.

Thanks for using MySQL!

```

Next we need to Create DATABASE for Drupla 


* To Create a Database Enter in mysql using root use commmand 


```

# mysql -u root -p

```

It Will ask for Root password give the root password what we created before for Database 


To see the Database alrady there use command 


```

# SHOW DATABASES;


```

Result will be Display like this 


```
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)
```


* Create a Database using command 

```

# CREATE DATABASE drupla;

```

* To Display and Check Weather its Created 
The Output is Here 



```
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| drupla             |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.00 sec)

```


Then Exit from MYSQL 



### NEXT we need to Install PHP




* To install the PHP Use the Following Command 


```

# sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt


```


![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_006.png)



It may also be useful to add php to the directory index, to serve the relevant php index files



```
# sudo vim /etc/apache2/mods-enabled/dir.conf

```


![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_007.png)


* Add index.php to the beginning of index files. The page should now look like this



```
<IfModule mod_dir.c>

          DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm

</IfModule>

```


* Check For PHP Modules


PHP also has a variety of useful libraries and modules that you can add onto your virtual server. You can see the libraries that are available.



```
apt-cache search php5-

```


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_008.png)


* The loaded Modules Will mbe Displayed like this if its Available in installation



```
php5-cgi - server-side, HTML-embedded scripting language (CGI binary)
php5-cli - command-line interpreter for the php5 scripting language
php5-common - Common files for packages built from the php5 source
php5-curl - CURL module for php5
php5-dbg - Debug symbols for PHP5
php5-dev - Files for PHP5 module development
php5-gd - GD module for php5
php5-gmp - GMP module for php5
php5-ldap - LDAP module for php5
php5-mysql - MySQL module for php5
php5-odbc - ODBC module for php5
php5-pgsql - PostgreSQL module for php5
php5-pspell - pspell module for php5
php5-recode - recode module for php5
php5-snmp - SNMP module for php5
php5-sqlite - SQLite module for php5
php5-tidy - tidy module for php5
php5-xmlrpc - XML-RPC module for php5
php5-xsl - XSL module for php5
php5-adodb - Extension optimising the ADOdb database abstraction library
php5-auth-pam - A PHP5 extension for PAM authentication
php5-enchant - Enchant module for php5
php5-exactimage - fast image manipulation library (PHP bindings)
php5-ffmpeg - audio and video support via ffmpeg for php5
php5-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
php5-geoip - GeoIP module for php5
php5-imagick - ImageMagick module for php5
php5-imap - IMAP module for php5
php5-interbase - interbase/firebird module for php5
php5-intl - internationalisation module for php5
php5-lasso - Library for Liberty Alliance and SAML protocols - PHP 5 bindings
php5-librdf - PHP5 language bindings for the Redland RDF library
php5-mapscript - php5-cgi module for MapServer
php5-mcrypt - MCrypt module for php5
php5-memcache - memcache extension module for PHP5
php5-memcached - memcached extension module for PHP5, uses libmemcached
php5-midgard2 - Midgard2 Content Repository - PHP5 language bindings and module
php5-ming - Ming module for php5
php5-mysqlnd - MySQL module for php5 (Native Driver)
php5-ps - ps module for PHP 5
php5-radius - PECL radius module for PHP 5
php5-remctl - PECL module for Kerberos-authenticated command execution
php5-rrd - rrd module for PHP 5
php5-sasl - Cyrus SASL extension for PHP 5
php5-suhosin - advanced protection module for php5
php5-svn - PHP Bindings for the Subversion Revision control system
php5-sybase - Sybase / MS SQL Server module for php5
php5-tokyo-tyrant - PHP interface to Tokyo Cabinet's network interface, Tokyo Tyrant
php5-uuid - OSSP uuid module for php5
php5-xcache - Fast, stable PHP opcode cacher
php5-xdebug - Xdebug Module for PHP 5

```

* If u need to install any modules, we can add using the command 



```
sudo apt-get install php5-gd

```


Here we Go Sucessfully Setuped a LAMP Server




To see the PHP server is Running in the server by adding a file 



```
sudo nano /var/www/info.php
```


![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_009.png)



* Enter the PHP code into the info file one we Creating


```
<?php
phpinfo();
?>
```


* Then restart the apache Server to take effect 



```

sudo /etc/init.d/apache2 restart


```


![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_010.png)



* We can View Our PHP setting in Web Mode Using IPaddress 


![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_011.png)


Then we need to Download Drupla From its Officail Site and Extract it into /var/www/



```
# cd /var/www/

```


### Download Drupla 


```
# wget http://ftp.drupal.org/files/projects/drupal-7.23.tar.gz

```


![12](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_012.png)



* Extract it using Command 



```

# tar -zxvf drupal-7.23.tar.gz

```


![13](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_013.png)


* Then Chmod the Drupla Directory to 


```

# chmod -R 777 /var/www/drupal

```


![14](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_014.png)


* Go to the directory 



```
# /var/www/drupal/sites/default

```

* Copy and paste the same file to other name as settings


```
	
# cp default.settings.php settings.php


```

* Change the Permission for those two file using 



```

# chmod 666 settings.php default.settings.php 

```


![15](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_015.png)


* Create files Directory if its not Created By Default 
And set the Permission for it 



```

# mkdir sites/default/files
# chmod a+w sites/default/files

```


* Then Once Restart the Apache server to take effect 


```

# sudo /etc/init.d/apache2 restart


```


![16](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_016.png)



Your Done ...


* Then we need to navigate to Web Browser to install the Drupla Step By Step


Here im Pointing my IP 192.168.122.19/drupla to install the drupla


```

http://192.168.122.19/drupla

```


After Installation we need to Do 



Step:1 



![17](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_017.png)



Step:2



![18](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_018.png)



Step:3




![19](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_019.png)



Step:4



![20](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_020.png)




Step:5




![21](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_021.png)



Step:6



![22](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_022.png)



Step:7



![23](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_023.png)



Step:8



![24](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_024.png)




At Last we need to change the Permission of this file and Folder 


Write permissions after install.

The install script will attempt to write-protect the settings.php file and
the sites/default directory after saving your configuration. If this
fails, you will be notified, and you can do it manually. Sample commands
from a Unix/Linux command line:


```

# chmod go-w sites/default/settings.php
# chmod go-w sites/default

```



![25](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Drupla%20Installation/Selection_025.png)

 If there is not Error in This Configuration Page No one can access your Settings page in Drupla , that means we are Safe ...


That's it ...


