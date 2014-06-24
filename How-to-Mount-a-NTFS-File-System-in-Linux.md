#### How to Mount a NTFS File System in Linux 

```

#wget http://tuxera.com/opensource/ntfs-3g_ntfsprogs-2013.1.13.tgz

# tar -xvf ntfs-3g_ntfsprogs-2013.1.13.tgz

#./configure

#make 

#make install

#mount -t ntfs-3g /dev/sdb1 /mnt/ntfs HDD


```

fstab Entry For Permanent mounting after restart 


```

#/dev/sda1 /mnt/ntfs HDD ntfs-3g defaults 0 0


```










