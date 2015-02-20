#### How to install Spark Client for Local chat server.

* Install 7.4 Java for Spark client:

Download the package from Local ftp Server.

```
# wget ftp://192.168.1.15/arrivu_contents/jdk-7u40-linux-x64.tar.gz
```

Check for the java current version.

```
#java -version
```
Create a Directory for Java Installation, Mostly this will be exist.


```
#sudo mkdir -p /usr/lib/jvm
```

Move the downloaded package to created directory.


```
# sudo mv jdk-7u40-linux-x64.tar.gz /usr/lib/jvm
```

Navigate to the installation Directory


```
#cd /usr/lib/jvm
```

Extract the tar java package and remove the package after extraction.


```
# sudo tar -zxvf jdk-7u40-linux-x64.tar.gz
# sudo rm -rfv jdk-7u40-linux-x64.tar.gz
```

Select which java need to be choosed 


```
# sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_40/bin/javac" 1

# sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_40/bin/java" 1

# sudo update-alternatives --set "javac" "/usr/lib/jvm/jdk1.7.0_40/bin/javac"

# sudo update-alternatives --set "java" "/usr/lib/jvm/jdk1.7.0_40/bin/java"
```

Set the Environment for Java

```
# sudo vi /etc/profile
```

Add the following entries to the bottom of your /etc/profile file:

```
###########
JAVA_HOME=/usr/lib/jvm/jdk1.7.0_40
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME export PATH
```

Activate the environment without restarting the system


```
# . /etc/profile
```

Now check for the Java version


```
# java -version
```


#### Install Spark Client


Download Spark Client from local Server.


```
# wget ftp://192.168.1.15/arrivu_contents/spark_2_6_3.tar.gz
```

Extract and move to Opt


```
# tar -zxvf spark_2_6_3.tar.gz
# sudo mkdir /opt/spark
# sudo rsync -avz Spark/* /opt/spark/
```

Create a Desktop Launcher for Spark client.


```
# sudo vim /usr/share/applications/spark.desktop
```

Append the below entry to created file.


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
Icon=/opt/spark/spark.png
TargetEnvironment=Unity
```

Download the Icon file after navigating to spark Directory.


```
# cd /opt/spark
# sudo wget https://dl.dropbox.com/u/50880014/spark.png
```

Install 32bit Dependencies for spark Client.

Note:> In Ubuntu 14.04 this steps will not work try the next steps.


```
# sudo apt-get install ia32-libs
```

* Ubuntu 14.04 Steps to enable 32 bit Packages

```
# sudo dpkg --add-architecture i386
# sudo apt-get update
# sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
# sudo ./adb
# sudo apt-get install ia32-libs
```

Or we can use the below command to fix.


```
# cd /etc/apt/sources.list.d
# sudo su
# sudo echo "deb http://old-releases.ubuntu.com/ubuntu/ raring main restricted universe multiverse" >ia32-libs-raring.list
# sudo apt-get update
# sudo apt-get install ia32-libs
```

Launch the spark client now it will work.

