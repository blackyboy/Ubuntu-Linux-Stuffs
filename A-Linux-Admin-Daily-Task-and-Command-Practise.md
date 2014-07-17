A Linux Admin Should take Backup Every Day
Must watch the Logs Every day . 

* To Know the Distribution Name and Version Which We Using 

```
# lsb_release -a

```

* To know the Kernel Version We Currently Using 

```

# uname -mrs  (or)  uname -a 

```

* To see the Linux Version 


```

# cat /proc/version

```

* To Check the Architecture Which We using 


```

# arch

```

* To Find a Particular Files Extension in Linux 

```

# find . -type f  -name '*.php' -printf '%TY-%Tm-%Td %TT %p\n' | sort

```

* How to Create A ISO File From Ubuntu Disk 

  Syntax if = input of = output


```
# dd if=/dev/cdrom of=/tmp/ubuntu

```

* This Will Create ISO Little faster 


```

# dd if=/dev/cdrom of=/tmp/ubuntu bs=4M

```

* This will Navigate to the up Directory from /home/sysadmin/Desktop/tmp/dir1/a/b/c

```
# $ cd ../../../..
```

To Here

/home/sysadmin/Desktop/tmp

* Automatically Correct Mistype Directory Names,
  this will check the spell and if its wrong while we type it will make correct automatically 

```
shopt -s cdspell
```


### Grep Commands

Grep and its Options

* -v	=	non-matching lines
* -c 	=	count of matching  lines
* -i	=	Ignore  case
* -r 	=	Read all  files  under  each  directory
* -l 	=	list the file which contain the searching keyword
*  ^    =       Search the Starting word of a file
* .$    =       Search the end word of a file
*  ^$   =       Search the empty lines in a file

Find all lines matching a specific keyword on a file.

```
grep sysadmin /etc/passwd
```

Display With Number's

```
grep -nv nologin /etc/passwd
```

To Avoid the keyword and search for other

```
grep -v sysadmin /etc/passwd
```

To Count how many lines match for the keywords we searchng

```
grep -c sysadmin /etc/passwd
```

To search text by ignoring the case 

```
grep -i sysadmin /etc/passwd
```

Search for subdirectories for a text matching a specific partern


```
grep -ri sysadmin /home/
```

Search for subdirectories for a text matching a specific partern and list the files which the keyword contain

```
grep -ril sysadmin /home/
```

To Search for a Particular IP mentioned among many IP's

```
grep -F "192.168.1.10" /var/log/syslog
```

To Search for a Word starts with Feb in a log file 

```
grep ^Feb /var/log/syslog
```

To Search for a word end with queue in a log file

```
grep queue.$ /var/log/mail.log
```

To find the Count of empty lines in a file

```
grep -c ^$ /var/log/mail.log
```

### Find commands

Syntax:

```
find {path} {conditions}
```

To Search for a file name access.log

```
find / -name access.log
```

To Search for a file name using ignoring the case

```
find / -iname access.log
```

To Search for the sysadmin user's Privilaged files

```
find / -user sysadmin
```

To search for the sysadmim group privialged files


```
find / -group sysadmin
```

To Search for files owned by a user and group


```
find / -user sysadmin -group student filename
```

To Search as student and mail

```
find / -user student -o -group mail
```

Which Dont have to show for the mail just show the student files

```
find / -user sysadmin -not -group mail
```

To Display only the files

```
find / -user sysadmin -type f
```

To Display Only the 2GB files and Less


```
find / -size 2G
```

To Display Only the 2GB files and More


```
find / -size +2G
```

To see the size between 2GB and 1GB 


```
find / -size 1G -size 2G
```

To see the permisson vise for files


```
find / -perm 000 -type f
```

To see the Permission vise 


```
find / -perm 777
```

To find the file more than 100 MB in Size 


```
find / type -f -size +100M
```

To find the file less than 100MB in Size 


```
find / -type f -size 100M
```

Find the files that are not modified in last number of days

```
find /-mtime +60
```

Find the files that are modified in last 2 days back


```
find / -mtime -2
```

Delete all the archive files with extension *.tar.gz
and greater than 100MB

```
find / -type f -name *.tar.gz -size +100M -exec ls -l {}\;

find / -type f -name *.tar.gz -size +100M -exec rm -f {}\;
```

To Copy only the file's of sysadmin from current Directory to /tmp/backup

To Check Using echo

```
find . -type f -user sysadmin -exec echo cp {} /tmp/backup/ \;
```

To Copy

```
find . -type f -user sysadmin -exec cp {} /tmp/backup/ \;
```

To find the total Size of files for a particular User in Current Directory 

```
find . -type f -user sysadmin -printf "%s\n" | awk '{t+=$1}END{print t}'
```

To Remove Only the sysadmin's files in Current Directory

```
find . -type f -user sysadmin -exec rm -rf {} \;
```

Archive all the files that are not modified in the
last x number of days

```
find /home/jsmith -type f -mtime +60 | xargs tar -cvf /tmp/`date '+%d%m%Y'_archive.tar`

```
To find large file more than 50MB size inside a Directory and subdirectory

```
find . -type f -size +50000k | xargs du -sh
```
### xargs Command
To Download a list of files which in a download.txt 

```
# cat download.txt | xargs wget -c
```

### wget commands 

To Download list of links from a file

```
# wget -i list_to_download_from_file.txt
```
To Download only sub-directory by avoiding parent Dir

```
# wget -i -np http://links-to-download/list/packages

```

### Sort Command

To find the Duplicated lines in a file

```
sort text.txt | uniq -c
```

To Display the only entries that are duplicates

```
sort text.txt | uniq -cd
```

### Stat Command

To get the status of a file 

```
stat test.txt
```

Display the status if the filesystem 

```
stat -f test.txt
```

### Diff Commands

-w	=	ignore the white spaces 

```
diff -w diff.txt diff1.txt
```

### Watch Command

To execute command Continously 

```
watch vmstat 
```

### AC Commands

Display Total Connect Time of Users

```
ac -d
```

Connect time for all the users

```
ac -p
```

Connect time for a specific user

```
ac -d sysadmin
```
