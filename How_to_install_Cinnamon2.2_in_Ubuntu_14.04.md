How to Install Cinnamon 2.2 in Ubuntu 14.04 LTS

* Cinnamon 2.2 is the latest edition of the cinnamon desktop environment, Came with Better looking for settings, Screensaver and power Management, Regional Settings and Keyboard Layouts, Date & Time Settings, Hot Corner and HUD, Applet Roles and Systray Icons, Menu Improvements, MPRIS and Sound Applet, HiDPI/Retina Display support, Graphics Tablet, A11y MouseWheel Zoom, Window manager improvements, Support for Xrandr cloning, and many more changes are there in Cinnamon 2.2, Linux Mint 17 Qianan have released with Cinnamon 2.2 by deafult.

There are Two ways of Installing Cinnamon 2.2 in Ubuntu machines 

 * By Adding a PPA Repository
 * By Editing and adding source repo to the source.list file


* Installing from PPA Repository:
  Add the PPA Repository and update and get install the Cinnamon

```
# sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
# sudo apt-get update
# sudo apt-get install cinnamon
```


* Installing by Editing Source.list
  Edit the file /etc/apt/sources.list with vim editor:

```
# sudo vim /etc/apt/sources.list
```

* Add the following line at the end of file  /etc/apt/sources.list

```
# deb http://packages.linuxmint.com/ qiana main upstream import
```

* Update the repository and install the key using
  Note : After the update we will get a keyring error, it will be fixed while we installing linumint-keyring


```
# sudo apt-get update

# sudo apt-get install linuxmint-keyring
```

* Update the repository and start install Cinnamon 2.2 using :

```
# sudo apt-get update && sudo apt-get install cinnamon -y
```

Here we have Done the Installtion, Reboot the machine and Login to your Cinnamon 2.2. 

