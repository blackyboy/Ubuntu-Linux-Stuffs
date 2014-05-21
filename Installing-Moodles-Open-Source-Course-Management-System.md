Installing Moodles Open Source Course Management System


First we Have to Setup a LAMP server for get installed moodles 

Here in below link u can see how to setup a LAMP server 


[Setting Up Lamp Server In Ubuntu 12.04 LTS](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/wiki/Settingup-a-LAMP-Server-in-Ubuntu12.04)


Then Navigate to the Directory 


```

# cd /var/www/

```


And Download the moodles Stable Package from officail Website 


```

# wget http://kaz.dl.sourceforge.net/project/moodle/Moodle/stable25/moodle-latest-25.tgz


```


Then  Untar the Downloaded file in that directory for installation



```

# tar -zxvf moodle-latest-25.tgz


```


![0000](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_0000.png)


Creat a Data Directory For Moodle Data under 

```

# /var/moodledata


```


And change the Ownership of this folder to www-data nologin user 


```

# chown www-data:www-data /var/moodledata


```


![00000000](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_00000.png)




Then Navigate to the Web browser using IP and get install 


```
http://192.168.122.69/moodle/
```
It will Ask For installation 


Step 1 


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_001.png)


Step 2


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_002.png)


step 3


![3](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_003.png)


Step 4

And Entire ur Database Info While ask like this



![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_004.png)


Step 5 



![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_005.png)


Here we need to copy the Code and Entire into a File as 


```

# vim /var/www/moodles/config.php


```

Give this Data , Here for my installation this one ... For you it may vary according to Version of software u using and user u chooses to create 


```
<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'root';
$CFG->dbpass    = 'admin123$';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbsocket' => 0,
);

$CFG->wwwroot   = 'http://192.168.122.3/moodle';
$CFG->dataroot  = '/var/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
```

![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_005.png)


Step 6 



![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_006.png)



Step 7 


![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_007.png)


Step 8 


Create a Admin User Here , By Default it will ask and u must Enter the Entry 


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_008.png)



Step 9


![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_009.png)


Step 10


Finished after Installation 



![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_010.png)



Step 11

We can Change the Appearance From Themes Under Admin Console 



![11](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_011.png)




Step 12


A Single Course Added 




![12](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/Installing%20moodle%20in%20ubuntu%2012.04/Selection_012.png)


That's it .....

 