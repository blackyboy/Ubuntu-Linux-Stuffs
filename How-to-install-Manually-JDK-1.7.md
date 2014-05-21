java -version

sudo mkdir -p /usr/lib/jvm

sudo mv jdk-7u21-linux-i586.tar.gz /usr/lib/jvm


cd /usr/lib/jvm

sudo tar zxvf jdk-7u21-linux-i586.tar.gz

sudo rm jdk-7u21-linux-i586.tar.gz

ls -l

jdk1.7.0_21


sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7                                             .0_21/bin/javac" 1

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0                                             _21/bin/java" 1



sudo update-alternatives --set "javac" "/usr/lib/jvm/jdk1.7.0_21/bin/javac"

sudo update-alternatives --set "java" "/usr/lib/jvm/jdk1.7.0_21/bin/java"


sudo nano /etc/profile

Add the following entries to the bottom of your /etc/profile file:

JAVA_HOME=/usr/lib/jvm/jdk1.7.0_21
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH

. /etc/profile


java âversion

