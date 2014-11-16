#### To Play .swf files in Linux Browsers

* We need to edit this file 

```
/usr/share/mime/packages/freedesktop.org.xml
```

* Then need to find the keyword adobe to get the below line.

```
<mime-type type="application/vnd.adobe.flash.movie">
```

* And change the above line to 

```
<mime-type type="application/x-shockwave-flash">
```

* Then update the database using

```
# update-mime-database /usr/share/mime
```

This will play .swf in all Browsers.
