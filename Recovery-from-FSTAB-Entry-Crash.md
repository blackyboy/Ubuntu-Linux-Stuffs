Here we can see How to recover from FSTAB entry crash
If we delete any entry in FSTAB and we cant know that , While reboot u receive any error as recovery mode 
follow these steps to get recovered from it ..

First to Recovery mode follow the Step in this page 

![Enter into Recovery Mode](https://raw.github.com/babinlonston/Ubuntu-Linux-Stuffs/master/Recovery%20from%20FSTAB%20Entry%20Crash/1.png)

> While this this the / was Mounted as read Only so we cant edit the fstab file , so we have to access the fstab file with write option for that we have to use the following steps 

![Choose Drop To Shell](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/2.png)

It will Show as

![Recovery Mode ask for Password](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/3.png)
```

recovery-mode #

```
We can't Edit The FSTAB Cos its Read Only 

![RO Condition to FSTAB ](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/4.png)


The root partition is mounted read-only. To mount it read/write, enter the command

![Use the Command Shown in this PIC](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/5.png)


```

#mount -o remount,rw /

```


If you have /home, /boot, /tmp, or any other mount point on a separate partition, you can mount them with the command


```

mount -a

```

Then Access the fstab file by

![Now its Writeable FSTAB File](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/6.png)


```

# vim /etc/fstab

```

And edit the Entry Which was messed & Correct it ,Save it and reboot are enter into init 5 Mode ...


Reboot or Use init 5 to boot in normal mode 


![Boot in Normal Mode to restart the PC](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Recovery%20from%20FSTAB%20Entry%20Crash/7.png)


That's it ...




