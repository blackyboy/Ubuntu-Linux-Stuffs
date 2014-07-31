#### Chroot in ubuntu or recovering Ubuntu,Debian Linux after a Windows Install


* boot from livecd of ubuntu, if you installed with system 32bit use 32bit Live CD, If 64bit use 64 bit live cd.


* Mount the Linux Partitions using

```
# sudo blkid
```

* Output:

```
sysadmin@localhost:~$ sudo blkid
[sudo] password for sysadmin: 
/dev/sda1: UUID="846589d1-af7a-498f-91de-9da0b18eb54b" TYPE="ext4" 
/dev/sda5: UUID="36e2f219-da45-40c5-b340-9dbe3cd89bc2" TYPE="swap" 
/dev/sda6: UUID="f1d4104e-22fd-4b06-89cb-8e9129134992" TYPE="ext4"
```

Here my / Partition is /dev/sda6

Mount the / Partition to mount point using


```
# sudo mount /dev/sda6 /mnt
```

Then Mount the linux access points, Linux devices, Proc, sys

Linux Device 


```
# sudo mount --bind /dev/ /mnt/dev
```

proc system information


```
# sudo mount --bind /proc/ /mnt/proc
```

Kernel information to user space


```
# sudo mount --bind /sys /mnt/sys
```

* If we need to enable the networking we need to do the following steps (Optional).


```
# cp /etc/resolv.conf /mnt/etc/resolv.conf
```

Change the Linux root to be the device we mounted earlier in step 2

```
# sudo chroot /mnt
```

* Then install the grub to write the new master boot record


```
# sudo grub-install /dev/sda
```

This will fix the multiboot issue.
