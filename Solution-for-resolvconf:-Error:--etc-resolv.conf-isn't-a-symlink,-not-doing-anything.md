Error >>>> resolvconf: Error: /etc/resolv.conf isn't a symlink, not doing anything

If we get this error in Ubuntu while Restarting Network 

Here /etc/resolv.conf is a file then move it to /run/resolvconf/resolv.conf.

Solution >>>> 

Move the file to /run/resolvconf/

```
# sudo mv /etc/resolv.conf /run/resolvconf/resolv.conf
```

Then create the symlink Using command:

```
# sudo ln -s ../run/resolvconf/resolv.conf /etc/resolv.conf
```

Then Restart the Network using 

```
# sudo /etc/init.d/networking restart
```

Or there is a Alternative way 

```
# sudo dpkg-reconfigure resolvconf
```

This will be solution for the Above error

That's it ...