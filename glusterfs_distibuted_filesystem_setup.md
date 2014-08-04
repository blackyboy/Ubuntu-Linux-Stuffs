#### Glusterfs Installation

* Search for the package from cache


```
# sudo apt-cache search gluster
```

* Install the package using


```
# sudo apt-get install glusterfs-server
```


* Edit the host file and add the servers which all need to be used in the glusterfs 


```
# sudo vim /etc/hosts

192.168.1.200   ubuntu.test     ubuntu
192.168.1.201	ubuntu1.test	ubuntu
```

* Create a Separate Partition using 

```
# sudo fdisk -c /dev/sdb
```

* Create a Directory to use for glusterfs and mount it


```
# sudo mkdir -p /glusterfs/shared_drive
# sudo mount /dev/sdb1 /glusterfs
# sudo df -h 
# sudo cat /etc/mtab
# sudo vim /etc/fstab
# sudo mount -a
```

* Create a Directory for GlusterFS Drive, This is a Separate Volume from /dev/sdb1 mounted under /glusterfs


```
# sudo mkdir -p /glusterfs/shared_drive
```

* Search for the available servers

```
#  sudo gluster peer probe 192.168.1.200
```

* Check for the status


```
# sudo gluster peer status
```

* Create the volume for the glusterfs


```
# sudo gluster volume create shared_drive transport tcp 192.168.1.200:/glusterfs/shared_vol 192.168.1.201:/glusterfs/shared_vol
```

* Start the volume 


```
# sudo gluster volume start shared_drive
```

* To get the information about the volume use


```
# sudo gluster volume info
```

##### Client side setup


* Search for the client pacakge


```
# sudo apt-cache search glusterfs
```

* Install the client pacakge from the search above


```
# sudo apt-get install glusterfs-client -y
```

* Mount the shared volume from the glusterfs server

```
# sudo mount -t glusterfs 192.168.1.100:/shared_driv /mnt/gluster/
```


* Check the partitions using 

# df -h



