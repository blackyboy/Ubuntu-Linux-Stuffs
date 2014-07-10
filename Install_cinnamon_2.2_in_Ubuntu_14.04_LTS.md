#### Install cinnamon 2.2 in Ubuntu 14.04 LTS

Install Cinnamon 2.2 from Linux Mint 17 Qiana repository in Ubuntu.

* Edit the file

```
# /etc/apt/sources.list
# sudo vim /etc/apt/sources.list
```

* Add the following line at the end of file in /etc/apt/sources.list

```
# deb http://packages.linuxmint.com/ qiana main upstream import
```

* Update the repository then install the authentication key

```
# sudo apt-get update
# sudo apt-get install linuxmint-keyring
```

* Update the repository again and install Cinnamon 2.2.


```
# sudo apt-get update
# sudo apt-get install cinnamon
```
That's it we have install Cinnamon 2.2, Restart the System and Choose Cinnamon while Login Screen Appear.

