How to Backup files from Ubuntu/Debian Server's to Amazon s3

If we have several VPS and we need to backup the data's and database's to Amazon S3 we can Use a Command line tool to copy the files from VPS server's to Amazon s3.

Note : Here My Bucket name is server-backup

First we need to install the S3 tool package

Step 1:

Add the Key using 

```
# sudo wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
```

Step 2:

Add the Repository 

```
# sudo wget http://s3tools.org/repo/deb-all/stable/s3tools.list -O /etc/apt/sources.list.d/s3tools.list
```

Step 3:

Update the Repository and Install the Package

```
# sudo apt-get update && apt-get install s3cmd
```

Step 4:

Then Configure the tool to using our amazon s3 storage bucket

While asking for the 

1. access secret 
2. access secret key
3. Choose a encryption password & Confirm too
4. choose if you have http or https

Step 5:

Here we can Create a Bucket to upload out file's

```
# s3cmd mb s3://server-backup
```
If we need to list the Created Directory use command

```
# s3cmd ls
```
Step 5:

Now we can upload a file there 

```
# s3cmd put server-backup20.tar.gz s3://server-backup/
```
Step 6:

If we need to list the file which we have uploaded now Use command

```
# s3cmd ls s3://server-backup
```
Step 7:

If we need to Download it from S3 Bucket use command 

```
# s3cmd get s3://server-backup/server-backup20.tar.gz
```
If we need to delete the file from S3 bucket use command del

```
# s3cmd del s3://server-backup/server-backup20.tar.gz
```

Thus we can copy a file from ubuntu or Debian Server's to S3 bucket
