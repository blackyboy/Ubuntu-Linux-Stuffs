Here i have used to update my Ubuntu Desktop Everyday, And there are many updates used to install,
Including the kernel updates too, So Here i have 4 kernel available now, And just i need 1 Kernel to work, 
So Here I'm going to remove the older kernel step by Step..


### Step 1:

This command Will Show us the Currently Running Kernel

```
sysadmin@system99:~$ uname -r
3.2.0-56-generic
```

### Step 2:

This command will give us the full Information about the Kernel 

```
sysadmin@system99:~$ uname -a
Linux system99 3.2.0-56-generic #86-Ubuntu SMP Wed Oct 23 09:20:45 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux
```

### Step 3:

List the all Available Kernel's Using command to find which all need to remove

```
sysadmin@system99:~$ dpkg -l | grep linux-image

ii  linux-image-3.2.0-54-generic           3.2.0-54.82                                         Linux kernel image for version 3.2.0 on 64 bit x86 SMP
ii  linux-image-3.2.0-56-generic           3.2.0-56.86                                         Linux kernel image for version 3.2.0 on 64 bit x86 SMP
ii  linux-image-generic                    3.2.0.56.66                                         Generic Linux kernel image
```

### Step 4:

Here I'm Going to remove the Older Kernel Version 3.2.0-54.82 using Purge Command 


```
# sudo apt-get purge linux-image-3.2.0-54-generic
```

This is the Output:

```
sysadmin@system99:~$ sudo apt-get purge linux-image-3.2.0-54-generic
sudo: unable to resolve host system99
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  language-pack-kde-zh-hans-base firefox-locale-zh-hans language-pack-kde-en kde-l10n-engb language-pack-zh-hans-base kde-l10n-zhcn
  language-pack-zh-hans language-pack-kde-zh-hans language-pack-kde-en-base
Use 'apt-get autoremove' to remove them.
The following packages will be REMOVED:
  linux-image-3.2.0-54-generic*
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 150 MB disk space will be freed.
Do you want to continue [Y/n]? 

(Reading database ... 234237 files and directories currently installed.)
Removing linux-image-3.2.0-54-generic ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 3.2.0-54-generic /boot/vmlinuz-3.2.0-54-generic
update-initramfs: Deleting /boot/initrd.img-3.2.0-54-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 3.2.0-54-generic /boot/vmlinuz-3.2.0-54-generic
Generating grub.cfg ...
Found linux image: /boot/vmlinuz-3.2.0-56-generic
Found initrd image: /boot/initrd.img-3.2.0-56-generic
Found memtest86+ image: /memtest86+.bin
done
The link /vmlinuz.old is a damaged link
Removing symbolic link vmlinuz.old 
 you may need to re-run your boot loader[grub]
The link /initrd.img.old is a damaged link
Removing symbolic link initrd.img.old 
 you may need to re-run your boot loader[grub]
Purging configuration files for linux-image-3.2.0-54-generic ...
Examining /etc/kernel/postrm.d .
run-parts: executing /etc/kernel/postrm.d/initramfs-tools 3.2.0-54-generic /boot/vmlinuz-3.2.0-54-generic
run-parts: executing /etc/kernel/postrm.d/zz-update-grub 3.2.0-54-generic /boot/vmlinuz-3.2.0-54-generic
```

### Step 5:

Have a Check after the Kernel Remove

```
sysadmin@system99:~$ uname -a

Linux system99 3.2.0-56-generic #86-Ubuntu SMP Wed Oct 23 09:20:45 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux

sysadmin@system99:~$ uname -r
3.2.0-56-generic

sysadmin@system99:~$ dpkg -l | grep linux-image
ii  linux-image-3.2.0-56-generic           3.2.0-56.86                                         Linux kernel image for version 3.2.0 on 64 bit x86 SMP
ii  linux-image-generic                    3.2.0.56.66                                         Generic Linux kernel image
```

I Have not Removed the generic Linux Kernel Image Becasue of it from default.
That's it We Have Done..
