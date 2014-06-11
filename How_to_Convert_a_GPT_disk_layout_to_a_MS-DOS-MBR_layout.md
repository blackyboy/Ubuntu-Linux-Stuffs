How to Convert GPT to MBR layout in any Drive's 

Here we can see how to change from GPT to MBR (Microsoft Master Boot Record), I need to format my pen drive while Installing Linux Mint Using USB, So i have formatted it using gdisk command, After that while i try to format my pen drive using fdisk i won't get format, It's give's the Below Error

![selection_002](https://raw.githubusercontent.com/blackyboy/Ubuntu-Linux-Stuffs/master/GPT_disk_layout_to_a_MS-DOS/Selection_001.png)

Here we can see how to get fix the Error by Converting the GPT to MBR type.

If you using RPM based Machine's, We can Install gdisk using below command


```
# yum install gdisk -y
```

If you using deb based Machine's, We can Install gdisk using below command


```
# sudo apt-get install gdisk
```

Then we have to Convert the GPT to MBR


```
# sudo gdisk /dev/sdb
```

We will get the Below Command Option


```
GPT fdisk (gdisk) version 0.8.8
Partition table scan:

  MBR: MBR only
  BSD: not present
  APM: not present
  GPT: not present

***************************************************************
Found invalid GPT and valid MBR; converting MBR to GPT format
in memory. THIS OPERATION IS POTENTIALLY DESTRUCTIVE! Exit by
typing 'q' if you don't want to convert your MBR partitions
to GPT format!

***************************************************************
Warning! Secondary partition table overlaps the last partition by
33 blocks!
You will need to delete this partition or resize it in another utility.

Command (? for help):
```

* Press r to Start Recovery from GPT to MBR

```
Command (? for help): r
```

* Recovery/transformation command (? for help):

* Then Convert by giving the command g to convert GPT to MBR

* If you need to see the Preview use P 

* Then Write the Changes and Exit the the gdisk using w

* Now we can Format the Pen Drive as usal using Disk Utility
