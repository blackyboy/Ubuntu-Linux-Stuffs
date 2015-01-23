#### Installing Cisco Packet tracer In Linux.

Download and extract using

```
# sudo tar -xvzf ciscopacket.tar.gz -C /opt/
```

Navigate to /opt/ Directory

```
# sudo cd /opt/PacketTracer601/
```

Install using 


```
# sudo ./install
```

Set the environment using 


```
# sudo ./set_ptenv.sh
```

Download the Icon 


```
# sudo  wget http://upload.wikimedia.org/wikipedia/en/d/dc/Cisco_Packet_Tracer_Icon.png
```

Create the Desktop Icon using 


```
# sudo cd /usr/share/applications
```

```
# sudo vim /packettracer.desktop
```

Append the Below content to the file using 


```
[Desktop Entry]
Name= Packettracer
Comment=Networking
GenericName=Cisco Packettracer
Exec=/opt/packettracer/packettracer
Icon=/usr/share/icons/packettracer.jpeg
StartupNotify=true
Terminal=false
Type=Application
```

Run the packaget tracer

```
# sudo packettracer
```



