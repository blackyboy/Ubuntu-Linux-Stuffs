Use a File for Additional Swap Space


If you don’t have any additional disks, you can create a file somewhere on your filesystem, and use that file for swap space.

The following dd command example creates a swap file with the name “swapfile” under /root directory with a size of 2048MB (2GB).

```

# dd if=/dev/zero of=/root/swapfile bs=1M count=2048
2048+0 records in
2048+0 records out


# ls -l /root/swapfile
-rw-r--r-- 1 root root 208565654 Jun 


```

Change the permission of the swap file so that only root can access it.


```

# chmod 600 /root/swapfile


```


Make this file as a swap file using mkswap command.


```

# mkswap /root/myswapfile
Setting up swapspace version 1, size = 2446546 kB


```

Enable the newly created swapfile.


```

# swapon /root/myswapfile


```

To make this swap file available as a swap area even after the reboot, add the following line to the /etc/fstab file.


```

# cat /etc/fstab
/root/myswapfile               swap                    swap    defaults        0 0

```

Verify whether the newly created swap area is available for your use.


```

# swapon -s


Filename                        Type            Size    Used    Priority
/dev/sda2                       partition       4192956 0       -1
/root/myswapfile                file            1048568 0       -2


```

To see the Swap free


```

# free -k
             total       used       free     shared    buffers     cached
Mem:       3082356    3022364      59992          0      52056    2646472
-/+ buffers/cache:     323836    2758520
Swap:      5241524          0    5241524


```


> Note: In the output of swapon -s command, the Type column will say “file” if the swap space is created from a swap file.

If you don’t want to reboot to verify whether the system takes all the swap space mentioned in the /etc/fstab, you can do the following, which will disable and enable all the swap partition mentioned in the /etc/fstab


```

# swapoff -a

# swapon -a


```