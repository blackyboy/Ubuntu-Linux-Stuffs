#### Adding 32bit Packages in Debian.

* To add 32 bit packages in debain we need to do the below steps.


```
# sudo dpkg --add-architecture i386 # enable multi-arch
# sudo apt-get update
# sudo apt-get install libc6:i386 # install base 32bit libraries
# sudo apt-get install ia32-libs
```

