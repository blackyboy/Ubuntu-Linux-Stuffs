##### Mysql Database Commands


you can login to mysql root account without providing any password as shown below.


```

# mysql -u root


```


If there is a Password Already Created For MySQL And u cant login using mysql -u root command Use Below Command 

Note : If there is a Password for MySQL and if u trying to Login with mysql -u root u will get Error as 

ERROR 1045 (28000):Access denied for user 'root'@'localhost'(using password:NO)
[Note: root access without password is denied]



```

# mysql -u root -p

```



To Create a Root Password For Mysql


PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:


```

# mysqladmin -u root password 'admin123$'

or

# mysql_secure_installation


```

To create a database in MySQL, you use the CREATE DATABASE statement as follows



```

# CREATE DATABASE babinlonston;


```


The SHOW DATABASE statement displays all databases in the MySQL database server.


```

# SHOW DATABASES;


```


Before working with a particular database, you must tell MySQL which database you want to work with by using the USE statement.



```

# USE babinlonston;

```


Removing or deleting Database
To delete a database, you use the DROP DATABASE statement as follows:



```

# DROP DATABASE babinlonston;


```


To Create Table Use Command 


```

# CREATE TABLE lonston(
	column_list
	  ) engine=table_type

```


To Backup a Single Database 


```

# mysqldump -u root -p admin123$ dbopenfire > tmp/openfiredb_backup.sql

```

To Restore a Single Database 


```

# mysql -u root -p admin123$ dbopenfire < tmp/openfiredb_backup.sql

```


To Restore Multiple Databases 


```

# mysqldump -u root -p admin123$ dbopenfire mysql > tmp/openfiredb&mysql_backup.sql

```

Backup All Databases


```

# mysqldump -u root -p admin123$ --all-databases > /tmp/all_databases_backup.sql

```

Backup a Local Database and restore to remote server using single command 


```

# mysqldump -u root -p admin123$ dbopenfire | mysql \ -u root -p admin123$ --host=192.168.1.5 -C openfire

```


