Grep Commands 


Search for a given string in a file (case in-sensitive search).

```

# grep -i "the" demo_file

```

Print the matched line, along with the 3 lines after it.

```

# grep -A 3 -i "example" demo_text


```

Search for a given string in all files recursively

```

# grep -r "ramesh" *

```


***


Find commands


Find files using file-name ( case in-sensitve find)


```

# find -iname "MyCProgram.c"


```

Execute commands on files found by the find command


```

# find -iname "MyCProgram.c" -exec md5sum {} \;

```

Find all empty files in home directory


```

# find ~ -empty

```

------------------------------------------------------------

SSH Commands 


Debug ssh client

```

#ssh -v -l jsmith remotehost.example.com

```

------------------------------------------------------------


When you copy a DOS file to Unix, you could find \r\n in the end of each line. 
This example converts the DOS file format to Unix file format using sed command.


```

#sed 's/.$//' filename

```

Print file content in reverse order

```

# sed -n '1!G;h;$p' thegeekstuff.txt

```

Add line number for all non-empty-lines in a file

```

# sed '/./=' thegeekstuff.txt | sed 'N; s/\n/ /'

```

------------------------------------------------------------

awk commands


Remove duplicate lines using awk

```

# awk '!($0 in array) { array[$0]; print }' temp

```

Print all lines from /etc/passwd that has the same uid and gid

```

#awk -F ':' '$3==$4' passwd.txt

```

Print only specific field from a file.

```

# awk '{print $2,$5;}' employee.txt

```

------------------------------------------------------------

vim commands


Go to the 143rd line of file

```

#vim +143 filename.txt

```

Go to the first match of the specified

```

# vim +/search-term filename.txt

```

Open the file in read only mode.

```

# vim -R /etc/passwd

```

diff commands

Ignore white space while comparing.

```

# diff -w name_list.txt name_list_new.txt

2c2,3
< John Doe --- > John M Doe
> Jason Bourne

```

-------------------------------------------------------------

sort commands


Sort a file in ascending order

```

# sort names.txt

```

Sort a file in descending order

```

# sort -r names.txt

```

Sort passwd file by 3rd field.

```

# sort -t: -k 3n /etc/passwd | more

```

-------------------------------------------------------------

xargs command


Copy all images to external hard-drive

```

# ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory

```

Search all jpg images in the system and archive it.

```

# find / -name *.jpg -type f -print | xargs tar -cvzf images.tar.gz

```

Download all the URLs mentioned in the url-list.txt file

```

# cat url-list.txt | xargs wget –c

```

-------------------------------------------------------------

ls command

Display filesize in human readable format (e.g. KB, MB etc.,)

```

# ls -lh

```

Order Files Based on Last Modified Time (In Reverse Order) Using ls -ltr

```

# ls -ltr

```

Visual Classification of Files With Special Characters Using ls -F

```

# ls -F

```


-------------------------------------------------------------


Shutdown commands

Shutdown the system and turn the power off immediately.

```

# shutdown -h now

```

Shutdown the system after 10 minutes.

```
# shutdown -h +10

```

Reboot the system using shutdown command.

```

# shutdown -r now

```

Force the filesystem check during reboot.

```
# shutdown -Fr now

```


-------------------------------------------------------------


ps commands


ps command is used to display information about the processes that are running in the system.

To view current running processes.

```

# ps -ef | more

```

To view current running processes in a tree structure. 
H option stands for process hierarchy.

```

# ps -efH | more

```


-------------------------------------------------------------

df commands

Displays the file system disk space usage. By default df -k displays output in bytes.

```

# df -k

```

df -h displays output in human readable form. i.e size will be displayed in GB’s.

```

#df -h

```

display what type of file system

```

#df -T

```


-------------------------------------------------------------


mysql commands


To connect to a remote mysql database.
This will prompt for a password.

```

# mysql -u root -p -h 192.168.1.2


```

To connect to a local mysql database.

```

$ mysql -u root -p

```


-------------------------------------------------------------


date commands

Set the system date:

```

# date -s "01/31/2010 23:59:53"

```

Once you’ve changed the system date, 
you should syncronize the hardware clock with the system date as shown below.


```
# hwclock –systohc

# hwclock --systohc –utc

```

