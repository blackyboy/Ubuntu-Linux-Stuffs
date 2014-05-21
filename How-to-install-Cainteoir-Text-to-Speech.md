
If we need to install any software for reading loud out the eBooks, we can install the cainterior from PPA repository

Step 1:

First we need to add the repository

```
# sudo apt-add-repository ppa:msclrhd-gmail/cainteoir
```

Step 2:

Update the Repository Using 

```
# sudo apt-get update
```

Step 3:

Then install the cainteoir Using following command 

```
# sudo apt-get install cainteoir-gtk
```

Step 4:

If we need to add a female Voice to read the books 

```
# sudo apt-get install mbrola-us1
```

Step 5:

To know the more languages which all supported for cainteoir we can grep from cache

```
# apt-cache search mbrola
```

Step 6:

To Install the selected package from cache Use command:

```
# sudo apt-get install mbrola_package_name
```

That's it...