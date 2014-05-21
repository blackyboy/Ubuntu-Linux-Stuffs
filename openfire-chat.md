 

Step 1. Login using SSH or Login Directly into ubuntu server 12.10. Before installing Openfire server, make sure your system is up to date. Enter the following commands, one by one, and install any available updates



```

# sudo apt-get update

```


Then upgrade Using 



```

# sudo apt-get upgrade

```


![1](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_001.png)


Step 2 : If you are using OpenJDK, remove it to minimise any Java conflicts


```

# sudo apt-get remove --purge openjdk*

```


![2](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_002.png)


Step 3 :  Install latest version of Oracle JRE/JDK


```

#java -version

#sudo mkdir -p /usr/lib/jvm

#sudo mv jdk-7u21-linux-i586.tar.gz /usr/lib/jvm

#cd /usr/lib/jvm

#sudo tar zxvf jdk-7u21-linux-i586.tar.gz

#sudo rm jdk-7u21-linux-i586.tar.gz

#ls -l

#jdk1.7.0_21

#sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7 .0_21/bin/javac" 1

#sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0 _21/bin/java" 1

#sudo update-alternatives --set "javac" "/usr/lib/jvm/jdk1.7.0_21/bin/javac"

#sudo update-alternatives --set "java" "/usr/lib/jvm/jdk1.7.0_21/bin/java"

#sudo vi /etc/profile

Add the following entries to the bottom of your /etc/profile file:

#JAVA_HOME=/usr/lib/jvm/jdk1.7.0_21 PATH=$PATH:$JAVA_HOME/bin export JAVA_HOME export PATH

#. /etc/profile

#java -version


```


![4](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_003.png)


![5](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_005.png)


![6](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_006.png)


![7](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_007.png)


![8](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_008.png)


![9](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_009.png)



![10](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_010.png)




Install JRE




Download JRE from Here 

```

# http://www.oracle.com/technetwork/java/javase/downloads/index.html

```


From Download Location we need to move the JRE tar package to the Directory 


```

# #sudo mv jre-7u40-linux-x64.tar.gz /usr/lib/jvm 

```

Navigate to the Directory 


```

#cd /usr/lib/jvm

```


Then uncompress it 


```

#sudo tar -zxvf jre-7u40-linux-x64.tar.gz

```


Then if we need to remove the tar file use below command 


```

#sudo rm jdk-7u21-linux-i586.tar.gz

```

List the files 


```

# ls -l

```


Open the directory 


```

# cd jre1.7.0_40

```


Afterwards run the following to get a list of currently installed java alternatives



```

# sudo update-alternatives --config java

```

We will get   



```

There are 3 choices for the alternative java (providing /usr/bin/java).

  Selection    Path                                            Priority   Status
------------------------------------------------------------
* 0            /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java   1071      auto mode
  1            /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java   1071      manual mode
  2            /usr/lib/jvm/jdk1.7.0_40/bin/java                1         manual mode
  3            /usr/lib/jvm/jre1.7.0_40/bin/java                0         manual mode

Press enter to keep the current choice[*], or type selection number: 3



```

Select Zero For Auto Mode 
Here i have selected 0 


Note : > if there was no previous java installation then the new JRE will be the default and you will not see the above.


```

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jre1.7.0_40/bin 0

```


This will add your new JRE 7 installation into alternatives list i.e. use the remembered number + 1 i.e. 3 in the example above. Now configure java to use the Oracle Java JRE


Check the version of you new JRE 7 installation


```

#java -version

```

Output Will be like this 


```

java version "1.7.0_25"
OpenJDK Runtime Environment (IcedTea 2.3.10) (7u25-2.3.10-1ubuntu0.13.04.2)
OpenJDK 64-Bit Server VM (build 23.7-b01, mixed mode)

```



Or use the Step Below to get easier 



```
#java -version

#sudo mkdir -p /usr/lib/jvm

#sudo mv jre-7u40-linux-x64.tar.gz /usr/lib/jvm

#cd /usr/lib/jvm

#sudo tar zxvf jre-7u40-linux-x64.tar.gz

#sudo rm jre-7u40-linux-x64.tar.gz

#ls -l

#jre1.7.0_40

#sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jre1.7.0_40/bin/javac" 3

#sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jre1.7.0_40/bin/java" 3

#sudo update-alternatives --set "javac" "/usr/lib/jvm/jre1.7.0_40/bin/javac"

#sudo update-alternatives --set "java" "/usr/lib/jvm/jre1.7.0_40/bin/java"

#sudo vi /etc/profile

Add the following entries to the bottom of your /etc/profile file:

#JAVA_HOME=/usr/lib/jvm/jre1.7.0_40 PATH=$PATH:$JAVA_HOME/bin export JAVA_HOME export PATH

#. /etc/profile

#java -version

```


After this we need to Add the Jre Plugins in Google chorme and mozilla For that 


Follow these instructions to enable Java in your web browser on Ubuntu Linux.

Google Chrome

Become the root user by running the su command and then enter the super-user password. Type: 


```
# sudo -s

```
Create a directory called plugins if you do not have it. Type: 


```
# mkdir -p /opt/google/chrome/plugins

```

Go to Google chrome plugins directory before you make the symbolic link. Type: 


```
# cd /opt/google/chrome/plugins

```

Create a symbolic link. Type: 


```

# ln -s /usr/lib/jvm/jre1.7.0_40/lib/amd64/libnpjp2.so


```


Restart your browser and test Java Here in Below Link 


```

# http://www.java.com/en/download/testjava.jsp

```


Mozilla Firefox

Become the root user by running the su command and then enter the super-user password. Type:


```
 
# sudo -s

```


Create a directory called plugins if you do not have it. Type: 


```

# mkdir -p /usr/lib/mozilla/plugins


```

Go to Google chrome plugins directory before you make the symbolic link. Type: 


```

# cd /usr/lib/mozilla/plugins

```

Create a symbolic link. Type: 


```

# ln -s /usr/lib/jvm/jre1.7.0_40/lib/amd64/libnpjp2.so


```


Restart your browser and test Java in below link


```

# http://www.java.com/en/download/testjava.jsp

```

***


Step 4 : Install MySql Database server


Install latest version MySQL server using apt-get


```

# sudo apt-get install mysql-server


```

![13](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_013.png)


Step 5 : Create new MySQL database for Openfire


Log in to MySQL Server as root.


```

# sudo mysql -u root -p


```


![14](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_014.png)


![15](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_015.png)


Create the database “dbopenfire”, add new user “openfire” and add new password “openfirepwd” for user “openfire”



```

mysql> CREATE DATABASE dbopenfire CHARACTER SET='utf8';
mysql> CREATE USER 'openfire'@'localhost' IDENTIFIED BY 'openfirepwd';
mysql> GRANT ALL PRIVILEGES ON dbopenfire.* TO openfire@localhost WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
mysql> quit

```

![18](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_018.png)


Step 6. Download and Install openfire 3.8.2


Download deb. package of Openfire 3.8.2 from ignite realtime download page


```

# http://www.igniterealtime.org/downloads/index.jsp

```

Download using wget command and install it 


Install openfire_3.8.2_all.deb with dpkg command:


```

# openfire_3.8.2_all.deb

```

![20](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_020.png)


ignore all installation errors regarding user and folder permissions.it cause depending on your version of JRE/JDK, Now you need to editing file /etc/init/d/openfire in line 27. Replace java-6-sun with java-6-oracle or java-7-oracle.


```

#vim /etc/init/d/openfire

```

Then replace the Line 27 With Which we have installed and set for JDK version



Then install


```

# sudo apt-get install rpl


```

![21](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_021.png)


Then Start the Service 



```

# /etc/init.d/openfire start


```




Step 7.  Allow ports for Openfire



You need to setup firewall and allow some ports for openfire on ubuntu server, use ufw command to set firewall openfire


```

sudo ufw allow 9090/tcp
sudo ufw allow 9091/tcp
sudo ufw allow 5222/tcp
sudo ufw allow 7777/tcp
sudo ufw allow 7443/tcp
sudo ufw allow 7070/tcp
sudo ufw allow 3478/tcp
sudo ufw allow 3479/tcp

```


his completes the initial installation steps for Openfire. Next, we’ll continue with configuration through a web browser



Step 8 :  Configuring Openfire Server



Configuring Openfire is very easy and can be completed in just a couple of steps. Here’s how to configure Openfire:

From computer in your network open your favorite browser  and go to :



```

# http://192.168.1.4:9090/

```


![22](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_022.png)


Databse Link 


```

jdbc:mysql://localhost:3306/dbopenfire


```

![25](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_025.png)


Replace 192.168.1.4:9090 above with your FQDN or IP address of your ubuntu server. The webpage shown below appears


![28](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_028.png)



![29](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_029.png)



Step 9 : Download and Install IM client 



You need to download install IM/VOIP client software on all PC/Laptop  to connect with the Openfire server. You can install any IM client that uses the XMPP/Jabber protocol for example the excellent Pidgin, it available for Linux Ubuntu, Windows, and Mac OSX.  for Ubuntu users pidgin can be installed from the Ubuntu Software Center.


```

# sudo apt-get install pidgin

```



If you have done install pidgin,Make sure that you select XMPP



The native cross plaform client for Openfire is Spark, it also available for Linux, Windows and Mac OSX. Download spark from Igniterealtime Download Page, and install it on ubuntu desktop edition (Ubuntu 11.04, Ubuntu 11.10, ubuntu 12.04 and Ubuntu 12.10)


```

# wget http://download.igniterealtime.org/spark/spark_2_6_3.tar.gz
# tar -zxvf spark_2_6_3.tar.gz
# sudo mkdir /opt/spark
# sudo mv Spark/* /opt/spark/

```


Create a desktop launcher file, Open terminal and run following command


```

# sudo vim /usr/share/applications/spark.desktop

```


Give this Entry's


```

[Desktop Entry]
Name=Spark
Version=2.6.3
GenericName=Spark
X-GNOME-FullName=Spark
Comment=ignite realtime Spark IM client
Type=Application
Categories=Application;Utility;
Path=/opt/spark
Exec=/bin/bash Spark
Terminal=false
StartupNotify=true
Icon=/opt/spark/logo-spark.png
TargetEnvironment=Unity

```

Navigate to Directory 


```

# sudo cd /opt/spark

```

Download the ICON from 


```

# sudo wget https://dl.dropbox.com/u/50880014/spark.png

```

If While Opening Spark its Does'nt Opens We need to install a 32bit Depency if u using 64bit Linux .


```

# sudo apt-get install ia32-libs

```

Now, You will then be able to search for Spark in you unity dash and launch Spark.


![30](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_030.png)


Here u see the Spark Launched and Entier ur detailes as username , Password and server address and login .



![31](https://github.com/babinlonston/Ubuntu-Linux-Stuffs/raw/master/openfire%20chat%20setup%20in%20Ubuntu%2012.04%20Server/Selection_031.png)



