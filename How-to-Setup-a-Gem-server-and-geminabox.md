```
sudo apt-get install -y zlib1g-dev libxml2-dev libmysqlclient-dev \
libxslt1-dev imagemagick libpq-dev nodejs \
libxmlsec1-dev libcurl4-gnutls-dev libxmlsec1

edit ~/.gemrc and /etc/gemrc

---
:update_sources: true
:sources:
- http://192.168.1.30:8808/
- http://gems.rubyforge.org/
:benchmark: false
:bulk_threshold: 1000
:backtrace: false
:verbose: true
gem: --no-ri --no-rdoc
install: --no-rdoc --no-ri 
update: --no-rdoc --no-ri

gem install bundler

mkdir ~/dev


---------------------
cd ~/dev

mkdir ~/dev/geminabox


git clone https://github.com/m-narayan/canvas-lms.git
sudo bundle install
git clone https://github.com/m-narayan/beacon.git
sudo bundle install
git clone https://github.com/m-narayan/rubycas-server.git
sudo bundle install
git clone https://github.com/m-narayan/kandan.git
sudo bundle install

sudo aptitude install libpq-dev

gem install geminabox

sudo apt-get install sqlite3 libsqlite3-dev
or
http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz

sudo gem install sqlite3-ruby -- --with-sqlite3-include=/usr/include


#Once mirroring finishes edit ~/.gem/mirror/config.ru

require "rubygems"
require "geminabox"

Geminabox.data = "./"
run Geminabox

cd ~/.gem/mirror
rackup

http://192.168.1.30:9292

# show where the gem files are stored and other gem specific environment values
gem environment


--------------------------------------------

Adding Gem in Init Process


# sudo vi/etc/init.d/gem-server


-------------------------------------------------

#!/bin/bash
# gem-server daemon
# chkconfig: 345 20 80
# description: gem-server daemon
# processname: gem

DAEMON_PATH="/usr/bin"

DAEMON=gem
DAEMONOPTS="server"

NAME=gem-server
DESC="gem-server daemon"
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

case "$1" in
start)
        printf "%-50s" "Starting $NAME..."
        cd $DAEMON_PATH
        PID=`$DAEMON $DAEMONOPTS > /dev/null 2>&1 & echo $!`
        #echo "Saving PID" $PID " to " $PIDFILE
        if [ -z $PID ]; then
            printf "%s\n" "Fail"
        else
            echo $PID > $PIDFILE
            printf "%s\n" "Ok"
        fi
;;
status)
        printf "%-50s" "Checking $NAME..."
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running"
            fi
        else
            printf "%s\n" "Service not running"
        fi
;;
stop)

---------------------------------------------

Save it wq! 

Modifiy it to Executable 

#chmod 777 gems-server

Make it to run in init 

#sudo update-rc.d gem-server defaults

#sudo service gem-server start 

#sudo service gem-server status

		(or)

#ps -ef | grep gem

to know the process Running


---------------------------------------------------
```
