#### How to Fix the Grub in Ubuntu 14.04

* Boot from Ubuntu Installation CD and Choosed Try Ubuntu, While in this live CD environment, in terminal

```
# sudo mount /dev/sda5 /mnt
# sudo rm -rf /boot
# sudo ln -s /mnt/boot /boot
```

* Then restarted the System using 

```
sudo init 6
```

Grub will be fixed here.

