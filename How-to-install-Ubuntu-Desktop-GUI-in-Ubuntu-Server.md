### How to install Ubuntu Desktop GUI in Ubuntu Server 


1.First we need to do Update 


```

# apt-get update 


```

2.Then install the Desktop Environment , This Command will install the GNOME Desktop Environment 
 


```

# sudo apt-get install ubuntu-desktop


```


3.IF we need to install the Desktop Environment Without installing some softwares like openoffice or Evolution
Use this command to install minimum , Here im using this command Cos alreay i have installed liberoffice 


```


# sudo aptitude install --without-recommends ubuntu-desktop


```

4.If You want to install light weight xubuntu Window


```

# sudo apt-get install xubuntu-desktop


```


5.If You want to install KDE Desktop Environment Use command 


```

# sudo apt-get install kubuntu-desktop


```



