```

###############################################################
#               Authorized access only!                       # 
# Disconnect IMMEDIATELY if you are not an authorized user!!! #
#       All actions Will be monitored and recorded            #
###############################################################


```


Create a LVM snapshot: lvcreate -L10G -s -n tmp_fserver_backup /dev/brace/fserver_root

That'll create a 10G(max) snapshot named "tmp_fserver_backup" from the LVM volume /dev/brace/fserver_root

From there you can make a new logical volume, and dd it in there.


[tutus](http://www.tutonics.com/2012/12/lvm-guide-part-2-snapshots.html)