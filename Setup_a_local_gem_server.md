#### Setup a local gem server

* First install any one of the gem

```
# sudo gem install "cancan"
```

* Then start the Gem server using 

```
# gem server --port 8808 --dir /var/lib/gems/1.9.1/ --bind 192.168.1.51 --no-daemon
```

```
gem server = start the gem server
--port = In which Port we need to run
--dir  = which directory need to be used as gem repository to store and serverd.
--bind = Need to run in this address.
--no-daemon = dont need to be run as a daemon.
```


If we need to run the gem server in background and while the server startup we need to add a small script 

* Create a Script file in any name

```
# vim gem.sh
```

* Append the following gemn server command in the created file 


```
gem server --port 8808 --dir /var/lib/gems/1.9.1/ --bind 192.168.1.51 --no-daemon &
```

* Then save and exit using wq!

* Now to start it automatically when server was up we need to add the created file in the rc.local


```
# sudo vim /etc/rc.local
```

* Append the created file location with sh to execute the command 


```
sh /home/sysadmin/gem.sh
```

save and quit rc.local using wq!

* Now the gem server used to run in the 192.168.1.51:8808, We can access the web interface using


```
http://192.168.1.51:8808/
```


#### Client side:


* Create two files in 

```
# vim ~/.gemrc 

# vim /etc/gemrc
```

* Add this Content in these above 2 files 

```
---
:update_sources: true
:sources:
- http://192.168.1.51:8808/
- http://gems.rubyforge.org/
:benchmark: false
:bulk_threshold: 1000
:backtrace: false
:verbose: true
gem: --no-ri --no-rdoc
install: --no-rdoc --no-ri 
update: --no-rdoc --no-ri
```

* Then install the gems using 


```
#gem install bundler
```

* clone any one of the project and install gems using 

```
# bundle install
```
