Disabling or Enabling Services from init Process 

```

#apt-get install rcconf

# rcconf

#apt-get install sysv-rc-conf

# sysv-rc-conf

```


If u want to enable any services Choose the Run Level and OK 

If u want to Disable any services Untick the Run Level and OK

----------------------------------------------------------------------------------------------

Permanently Removing Services from init Process 


```

# update-rc.d -f {SERVICE-NAME} remove

```

