#### Sudo without Password

Edit the sudoer file using 


```
# visudo
```

Then add the user which Don't need to use the passwd

```
# %sysadmin ALL=(ALL) NOPASSWD:ALL
```

That's it
