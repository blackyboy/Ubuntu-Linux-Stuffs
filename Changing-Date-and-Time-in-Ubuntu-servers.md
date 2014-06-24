##### Here we can see step by step for Setting time by TimeZone in ubuntu Server


First we need to delete the File localtime in

```

# etc/ rm localtime

```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20Timezone%20in%20ubuntu%20Servers/Selection_001.png)


Then link the file Kolkata Time Zone to /etc

```

# # ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

```

![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20Timezone%20in%20ubuntu%20Servers/Selection_002.png)


Here we can see the file was soft linked 


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20Timezone%20in%20ubuntu%20Servers/Selection_003.png)


To See the Current Date and time use command 

```

# date

```

![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Changing%20Timezone%20in%20ubuntu%20Servers/Selection_004.png)



