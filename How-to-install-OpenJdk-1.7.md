

sudo apt-get -y install openjdk-7-jre


sudo update-java-alternatives -s java-1.7.0-openjdk-amd64


unlink /usr/lib/jvm/default-java


ln -s /usr/lib/jvm/java-1.7.0-openjdk-amd64 /usr/lib/jvm/default-java
