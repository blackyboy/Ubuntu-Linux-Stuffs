#### MYSQL Resetting a lost MySQL root password


Stop the MYSQL service

```
# sudo /etc/init.d/mysql stop
```

Then run the in safe mode

```
# sudo mysqld_safe --skip-grant-tables &
```

Login to mysql root user

```
# mysql -u root
```

Choose the mysql database


```
# use mysql;
```

Update the password now using 


```
# update user set password=PASSWORD("mynewpassword") where User='root';
```

Flush all changes using 

```
# flush privileges;
```

Quit from mysql and restart the service using 


```
# \q

# sudo /etc/init.d/mysql start
```

Login to root user and check the changes made for MYSQL Root password


```
# mysql -u root -p
```
