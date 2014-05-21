

To install Glances Monitoring Tool use the Following Commands


```
# sudo apt-get install python-pip build-essential python-dev
# sudo pip install Glances
# sudo pip install PySensors
```


To start glances simply type glances in terminal.


```

GREEN : the statistic is “OK”
BLUE : the statistic is “CAREFUL” (to watch)
VIOLET : the statistic is “WARNING” (alert)
RED : the statistic is “CRITICAL” (critical)


```



When Glances is running, you can press some special keys to give commands to it:


```

c: Sort processes by CPU%  
m: Sort processes by MEM%  
p: Sort processes by name  
i: Sort processes by IO Rate  
d: Show/hide disk I/O stats  
f: Show/hide file system stats  
n: Show/hide network stats  
s: Show/hide sensors stats  
b: Bit/s or Byte/s for network IO  
w: Delete warning logs  
x: Delete warning and critical logs  
1: Global CPU or Per Core stats  
h: Show/hide this help message  
q: Quit (Esc and Ctrl-C also work)  
l: Show/hide log messages


```

You can set your thresholds in Glances configuration file, on GNU/Linux, the default configuration file is located in /etc/glances/glances.conf.


If we Start glance -s it will work as a server and we can monitor it from other server using ip address 

eg : glance -c@192.168.1.96





![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Glance%20Monitoring/Selection_001.png)


