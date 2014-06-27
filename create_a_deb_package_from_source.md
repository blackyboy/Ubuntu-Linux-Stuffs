#### Create a .deb Package From Source & Install It Automatically

Package Requierd 

build-essential
automake
autoconf
libtool
pkg-config
libcurl4-openssl-dev
intltool
libxml2-dev
libgtk2.0-dev
libnotify-dev
libglib2.0-dev
libevent-dev
checkinstall


```
# sudo apt-get install build-essential automake autoconf libtool pkg-config libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev libevent-dev checkinstall
```


#### Now we can make the package


* Extract the Source tarball .tar.bz2 file


```
#  tar xvjf file.tar.bz2 

# cd folder_of_extracted
```

* Open the location in terminal


```
# ./configure && make && sudo checkinstall
```
  
  This will create a .deb package for you and automatically install it in our system


* To remove the package use the command 

```
# sudo dpkg -r package_name
```



