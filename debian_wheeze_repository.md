#### Repository for Debian GNU/Linux 7.8 (wheezy)

Edit the file repo file

```
# vim /etc/apt/sources.list
```

* Append to the source.list

```
deb http://ftp.us.debian.org/debian stable main contrib non-free
deb-src http://ftp.us.debian.org/debian stable main contrib non-free

deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb-src http://ftp.debian.org/debian/ wheezy-updates main contrib non-free

deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

#Third Parties Repos
#Debian Mozilla team
deb http://backports.debian.org/debian-backports squeeze-backports main
#deb-multimedia.org
deb http://www.deb-multimedia.org squeeze main non-free

# Firefox, Thunderbird, vlc
#deb http://packages.linuxmint.com debian import

# Virtual Box Repo
deb http://download.virtualbox.org/virtualbox/debian wheezy contrib
```

