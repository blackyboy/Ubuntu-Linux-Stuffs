How to install Windows 7 after Ubuntu and dual boot

Here's the Steps:

1. Make space for Windows 7
2. Install Windows 7
3. Reinstall [GRUB][1]
    1. Mount the `/boot` partition
5. Install the boot loader

##### Step One

Open up [GParted][2], and make sure that you have at least 20&nbsp;GB available for Windows 7, either as a partition you can remove, or as unpartitioned space. If it's a partition, remove it from GRUB to make sure it doesn't break your Ubuntu install -- GParted will complain if anything bad is about to happen. *Make note of current `/boot` device. If that doesn't show up there, make note of the `/` device. The device name is something like `sda5`*.

###Step Two

Install Windows 7 into the space were unpartition left for windows Installation

###Step Three

Load up from your [Ubuntu live CD][3] Ubuntu Instllation Disk and choose Try ubuntu, and then run these commands.

If you DO NOT have a separate `/boot` partition:

```
# sudo mount /dev/sda5 /mnt
# sudo rm -rf /boot
# sudo ln -s /mnt/boot /boot
```

* If you have a SEPARATE `/boot` partition:

```
# sudo mount /dev/sda /boot
```

###Step Four

* Then continue with those commands:

```
# sudo apt-get update && sudo apt-get install grub-pc
# sudo grub-install /dev/sda     # NOTE THAT THERE IS NO DIGIT
# sudo umount /boot
```

* And restart. It should work fine and boot both systems.

