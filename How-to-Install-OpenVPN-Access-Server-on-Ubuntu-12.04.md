IP Address Im Using : 192.168.0.10

Operating System I'm using

```
# lsb_release -a
```
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 12.04 LTS
Release:	12.04
Codename:	precise

Step 1:

Download the .deb package for Installation 

32 bit Version

```
# sudo wget http://swupdate.openvpn.org/as/openvpn-as-1.8.4-Ubuntu10.i386.deb
```
64 Bit Version

```
# sudo wget http://swupdate.openvpn.org/as/openvpn-as-1.8.4-Ubuntu10.amd_64.deb
```
Step 2:

Insall the package what we have downloaded

```
# sudo dpkg -i openvpn-as-1.8.4-Ubuntu10.amd_64.deb 
```
Step 3:

Here we need to create a password for User openvpn,

'openvpn' is the Default user which will get created while the Openvpn Installation

```
# sudo passwd openvpn
```

Step 4:

Login to access the vpn

Access Server web UIs are available here:

```
Admin  UI: https://192.168.0.10:943/admin
Client UI: https://192.168.0.10:943/
```

![](https://raw.github.com/blackyboy/Ubuntu-Linux-Stuffs/master/vpn.png)