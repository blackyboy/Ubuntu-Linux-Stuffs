#### How to get Ubuntu back after installing Windows?


When we install Windows, Windows assumes it's the only OS on the machine or at least it doesn't account for Linux. So, it replaces GRUB with its own boot loader. What we have to do is to replace the Windows boot loader with GRUB. Simply chroot into your install and run update-grub. chroot is great because it allows you to work on your actual install.

Boot from the live CD.

Determine the partition number of your main partition. I'm going to assume here /dev/sda5, but make sure you use the correct partition number for your system.

Mount your partition:

```
# sudo mount /dev/sda5 /mnt  
```

Bind mount with other necessary filesystems.


```
# for i in /sys /proc /run /dev; do sudo mount --bind "$i" "/mnt$i"; done
```

chroot into your Ubuntu install.


```
# sudo chroot /mnt
```

At this point, you're in your install, not the live CD, and running as root. Update grub:


```
# update-grub
```

If you get errors, go to step 7.

Depending on your situation, you might have to reinstall grub:

```
# grub-install /dev/sda
# update-grub 
```

If everything worked without errors, then you're all done.

```
# exit
# sudo init 6
```

At this point, you should be able to boot normally.


Refernce URL : http://askubuntu.com/questions/88384/how-can-i-repair-grub-how-to-get-ubuntu-back-after-installing-windows
Thanks to Scott Severance.


