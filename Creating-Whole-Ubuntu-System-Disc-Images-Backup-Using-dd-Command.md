
Creating Whole Ubuntu System Disc Images Backup Using dd Command

***

Creating Disc Images Using dd

Introduction

dd is an old command line program used for low level copying of files. It is a legacy program from UNIX, as such it does not behave or configure like traditional programs in the GNU suite. Caution is advised, using this command with the wrong operators can cause serious data loss.

In the following commands, if and of are short for input file and output file respectively. As the names imply, the input is the partition being backed up and output is the directory where the archive is created. Last important note, you need to know what partition you want to backup and what it's label is. To find out, open a terminal and use the following command:

```

sudo fdisk -l

```

The output of the command will list each hard drive installed, and all the partitions on it. It is usually possible to tell which is which by looking at the filesystem installed (ntfs for Windows, Linux for Linux) and the size it occupies on the disk. The user is responsible for knowing which partition is to be backed up. In the following examples replace /dev/hda1 with the name of the partition listed under device boot in the output. Those who prefer a graphical display of your partitions, use gparted. If you want to backup an entire drives data, rather than simply a partition on it, omit the number after the drive name, in our example, use hda.

One additional important note is that if you are restoring a partition to the hard drive, it is highly recommended that you work from a live CD session of Ubuntu. Restoring partitions that are in use (i.e. while booted in Ubuntu or Windows) will cause errors.

Backup with dd
The following are simply examples to understand use of dd, they are informational in nature. Do not simply copy them and use them in a terminal, ensure their use is understood and that they have been modified to a user's specific situation and needs.


The following example will create a drive image of partition hda1, the image will be created in the home directory as the file hda1.bin .

```

dd if=/dev/hda1 of=/home/hda1.bin bs=1024


```


This command creates the drive image and then passes it through gzip for compression. Bzip2 could be substituted instead of gzip for greater compression.

```

dd if=/dev/hda1 bs=1024 | gzip > /home/hda1.bin.gz


```

Back up the MBR of the hard drive labelled hda.


```

dd if=/dev/hda of=/home/hda.boot.mbr bs=512 count=1 

```


The following command will overwrite drive hdb to have the same data as hda, this will wipe out all data previously on hdb. This is the same as synchronizing all data on the first drive with the second.

```

dd if=/dev/hda of=/dev/hdb conv=noerror,sync bs=1024

```


Restoring a Drive Image


To restore a drive image, as noted above always perform such an action from a live environment to avoid problems with the running operating system, unless your certain it won't conflict. The drive or partition you want to restore to must be exactly equal to or larger than the original size of the partition. Restoration is quite simple, and really just involves reversing the if and of values. This will tell dd to overwrite the drive or partition with the data that is stored in the file. ALLOne caveat, ensure the file dd is using as reference isn't stored on the partition or drive you're restoring to. If you do this, eventually during the operation dd will overwrite the reference and then fail. Best to use an external/other drive or network storage to hold such drive image archives.

First go superuser and switch to runlevel 1 so that you can fumble around with the harddisk without other services interfering:

```
sudo -i

init 1

```


To restore the first partition on hda continuing our example, we would do the following.


```

dd if=/home/hda1.bin of=/dev/hda1 bs=1024

```

o restore a gzipped image of a partition we would use the following syntax (substitute bzip2 for gzip if you used bzip2 compression):


```

gzip -dc /home/hda1.bin.gz | dd of=/dev/hda1 bs=1024

```

The option -d means decompress, the option -c means output to stdout, or in this case, to dd via the pipe.

The following command would restore the mbr of the first drive with the backup we previously made.

```

dd if=/mnt/hda1/home/hda.boot.mbr of=/dev/hda bs=512 count=1

```

If you restored the whole drive (/dev/hda), the system will not automatically create the devices (/dev/hda1, /dev/hda2). To force automatic detection, reboot after completion.

If you restored the system to a new drive, and the device identifiers (called UUIDs, see UsingUUID for a more complete discussion) changed then you must adapt the bootloader and the mount points. While still on runlevel 1, edit these files with your preferred text editor:


```

/boot/grub/menu.lst

/etc/fstab

```

To know what the new UUIDs for your drives are, use the following command:


```

sudo blkid 

```


From this list, you can cross-reference the information with that of fdisk to know which drive/parition is which. Then simply update the UUIDs in both GRUB and fstab files. 


Once all this is finished, you will be able to resume normal operation where you left off. At this time, if the drive in question is larger than the original, you can edit the partition structure to your liking or add new ones. 


