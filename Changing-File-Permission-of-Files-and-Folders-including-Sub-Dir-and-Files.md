To Change the Permission of Every Files inside a Directory and Sub Directory


```

            #chmod 644 $(find /path/to/base/dir -type f)
                              (or)
            #find /home/sysadmin/babin/ -type f -print0 | xargs -0 chmod 644

                                  
```

Change the Folder Permissions and its Subfolders Permissions

```
         #find folder_name -type d -exec chmod 775 ‘{}’ \;

                            (or) 

         #find /home/sysadmin/babin/ -type d -print0 | xargs -0 chmod 644
 
                            (or)

         #chmod 755 $(find /path/to/base/dir -type d)

```


To recursively give directories read&execute privileges:

```
          #find /path/to/base/dir -type d -exec chmod 755 {} +

```


To recursively give files read privileges


```

          #find /path/to/base/dir -type f -exec chmod 644 {} +


```


