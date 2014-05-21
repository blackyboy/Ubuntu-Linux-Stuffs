To Compress a File or Folder using TAR 

```

# tar -cvf babinlonston.tar /file  0r Folder

```

To Test the Compressed Archive 

```

# tar -tf babinlonston.tar 

```

This will diplay With Permission

```

# tar -tvf babinlonston.tar 

```

To Extract the Compressed file 

```

# tar -xvf babinlonston.tar

```

This will extract the File using command -xvf 

```

# tar -C /tmp -xvf babinlonston.tar

```

To Add Directory or files to a tar file 

```

# tar -u /babinlonston -vf babinlonston.tar  

```

```

# tar -tvf babinlonston.tar 

```

To Compress using gunzip

```
# gzip babinlonston.tar 

```

To uncompress a tar.gz using gunzip

```
# gunzip babinlonston.tar.gz 

```

To compress a file using bzip2

```

#bzip2 babinlonston.tar

```

To uncompress a File using tar.bz2

```

#bunzip2 babinlonston.tar.bz2

```

To compress a file using tar + bzip2 

```

# tar -cjvf babinlonston.tar.bz2 /babinlonston

```

To extract the file use 

```

# tar -xjvf babinlonston.tar.bz2

```

This Will extract in /tmp if we use the -C (Capital C)

```

# tar -C /tmp -xjvf babinlonston.bz2

```

The Compression method if used in tar+gzip will be a powerfull compression 
It will compress the huge file into small ..


Gzip Compression - This Will compress using gzip

```
# tar -czvf babinlonston.tar.gz /babinlonston

```

To extract the file use

```

# tar - zxvf babinlonston.tar.gz 

```

If we need to Extract the file to a particular Directory Use command Here we Use TMP dircetory 

```

# tar -c /tmp -xzvf babinlonston.tar.gz 

```



