Debian based systems (including Ubuntu) uses apt-* commands for managing packages from the command line.

In this article, using nmap installation as an example, let us review how to use apt-* commands to view, install, remove, or upgrade packages.

1.The following example shows how to search the repository for a specific package name.

```

# apt-cache search ^nmap$

nmap - The Network Mapper

```

2. apt-cache search: Search Repository Using Package Description

If you don’t know the exact name of the package, you can still search using the package description as shown below.

```

# apt-cache search "nmap"

```
The Output is here

 
```
nmap - The Network Mapper
doscan - port scanner for discovering services on large networks
foomatic-gui - GNOME interface for configuring the Foomatic printer filter system
honeyd - Small daemon that creates virtual hosts simulating their services and behaviour
libfusioninventory-agent-task-netdiscovery-perl - Network device discovery for FusionInventory Agent
libnmap-parser-perl - parse nmap scan data with perl
nmapsi4 - graphical interface to nmap, the network scanner
p0f - Passive OS fingerprinting tool
pads - Passive Asset Detection System
pbnj - a suite of tools to monitor changes on a network
piwi - P(erl|relude) IDS Web Interface - A frontend to your Prelude database
pnscan - Multi threaded port scanner
psad - Port Scan Attack Detector
python-nmap - Python interface to the Nmap port scanner
python-scapy - Packet generator/sniffer and network scanner/discovery
umit - network tool and graphical frontend for nmap
xprobe - Remote OS identification
zenmap - The Network Mapper Front End

```

3. apt-cache show: Basic Information About a Package

Following example displays basic information about apache2 package.

```

# apt-cache show nmap

```

***

```
Package: nmap
Priority: extra
Section: net
Installed-Size: 6751
Maintainer: LaMont Jones <lamont@debian.org>
Architecture: amd64
Version: 5.21-1.1ubuntu1
Replaces: ndiff
Provides: ndiff
Depends: libc6 (>= 2.7), libgcc1 (>= 1:4.1.1), liblua5.1-0, libpcap0.8 (>= 0.9.8), libpcre3 (>= 8.10), libssl1.0.0 (>= 1.0.0), libstdc++6 (>= 4.6)
Conflicts: ndiff
Filename: pool/main/n/nmap/nmap_5.21-1.1ubuntu1_amd64.deb
Size: 1642976
MD5sum: 3830ef984976dbcc08a7f19114353532
SHA1: 56b3f02b6f6993dd13432c820c31f89875e8d06c
SHA256: 05bdea8a3f22057471b8091bd57d23f5e805eb3e03ab6eb4539036c619bb4196
Description-en: The Network Mapper
 Nmap is a utility for network exploration or security auditing. It
 supports ping scanning (determine which hosts are up), many port
 scanning techniques, version detection (determine service protocols
 and application versions listening behind ports), and TCP/IP
 fingerprinting (remote host OS or device identification). Nmap also
 offers flexible target and port specification, decoy/stealth scanning,
 sunRPC scanning, and more. Most Unix and Windows platforms are
 supported in both GUI and commandline modes. Several popular handheld
 devices are also supported, including the Sharp Zaurus and the iPAQ.
Description-md5: bc417f4c1fdba7d8d9b0ca8a2a90b7a8
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Origin: Ubuntu
Supported: 5y

```

4. apt-cache showpkg: Detailed Information About a Package

“apt-cache show” displays basic information about a package. Use “apt-cache showpkg” to display detailed information about a package as shown below.

```

# apt-cache showpkg nmap

```
***

```

Package: nmap
Versions: 
5.21-1.1ubuntu1 (/var/lib/apt/lists/in.archive.ubuntu.com_ubuntu_dists_precise_main_binary-amd64_Packages) (/var/lib/dpkg/status)
 Description Language: 
                 File: /var/lib/apt/lists/in.archive.ubuntu.com_ubuntu_dists_precise_main_binary-amd64_Packages
                  MD5: bc417f4c1fdba7d8d9b0ca8a2a90b7a8
 Description Language: en
                 File: /var/lib/apt/lists/in.archive.ubuntu.com_ubuntu_dists_precise_main_i18n_Translation-en
                  MD5: bc417f4c1fdba7d8d9b0ca8a2a90b7a8


Reverse Depends: 
  ibid,nmap
  checkbox,nmap
  nmap:i386,nmap
  nikto,nmap
  zentyal-core,nmap
  zenmap,nmap
  umit,nmap 4.50
  tcosmonitor,nmap
  pbnj,nmap
  openvas-plugins-dfsg,nmap
  ocsinventory-server,nmap
  ocsinventory-reports,nmap
  ocsinventory-agent,nmap
  nmapsi4,nmap
  lsat,nmap
  libnmap-parser-perl,nmap
  jffnms,nmap
  ipplan,nmap
  ibid,nmap
  fusioninventory-agent,nmap
  foomatic-gui,nmap
  atheist,nmap
  checkbox,nmap
Dependencies: 
5.21-1.1ubuntu1 - libc6 (2 2.7) libgcc1 (2 1:4.1.1) liblua5.1-0 (0 (null)) libpcap0.8 (2 0.9.8) libpcre3 (2 8.10) libssl1.0.0 (2 1.0.0) libstdc++6 (2 4.6) ndiff (0 (null)) ndiff:i386 (0 (null)) ndiff (0 (null)) ndiff:i386 (0 (null)) nmap:i386 (0 (null)) 
Provides: 
5.21-1.1ubuntu1 - ndiff 
Reverse Provides: 

```

5.apt-cache depends: List all Dependent Packages

Before installation, if you like to view all the dependent packages, use “apt-cache depends” as shown below.


```

# apt-cache depends nmap

```
Output as 

```
nmap
  Depends: libc6
  Depends: libgcc1
  Depends: liblua5.1-0
  Depends: libpcap0.8
  Depends: libpcre3
  Depends: libssl1.0.0
  Depends: libstdc++6
  Conflicts: <ndiff>
  Conflicts: <ndiff:i386>
  Replaces: <ndiff>
    nmap
  Replaces: <ndiff:i386>
    nmap:i386
  Conflicts: nmap:i386

```
6.dpkg -l: Is the Package Already Installed?

Before installing a package, you may want to make sure it is not already installed as shown below using dpkg -l command.

```

# dpkg -l | grep -i nmap

```

Output as 

```

ii  nmap                5.21-1.1ubuntu1                  The Network Mapper

```

7. apt-get install: Install a Package

Finally, install the package using “apt-get install” as shown below


```

# sudo apt-get install nmap

```

8.dpkg -l : Verify Whether the Package got Successfully Installed


```

# dpkg -l | grep nmap
ii  nmap                   5.21-1.1ubuntu1                       The Network Mapper

```


9. apt-get remove: Delete a Package

Use “apt-get purge” or “apt-get remove” to delete a package as shown below.


```

# sudo apt-get purge nmap


Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  nmap*
0 upgraded, 0 newly installed, 1 to remove and 559 not upgraded.
After this operation, 6,913 kB disk space will be freed.
Do you want to continue [Y/n]?


```

                          (or)


```

# sudo apt-get remove nmap
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 559 not upgraded.
After this operation, 6,913 kB disk space will be freed.
Do you want to continue [Y/n]?

```

Note :

> apt-get remove will not delete the configuration files of the package

> apt-get purge will delete the configuration files of the package


10. apt-get -u install: Upgrade a Specific Package

The following example shows how to upgrade one specific package.


```

# apt-get -u install nmap

```

11. apt-get -u upgrade: Upgrade all Packages

To upgrade all the packages to it’s latest version, use “apt-get -u upgrade” as shown below.


```

# apt-get -u upgrade 

```
It Will ask For Update if we need to update we can choose Y to install all updates

```

Reading package lists... Done
Building dependency tree       
Reading state information... Done
nmap is already the newest version.
0 upgraded, 0 newly installed, 0 to remove and 559 not upgraded.
root@sysadminlinux:/# clear

root@sysadminlinux:/# apt-get -u upgrade 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages have been kept back:
  ginn hplip hplip-data libgrip0 libhpmud0 libsane-hpaio libunity-2d-private0
  libunity-core-5.0-5 linux-generic linux-headers-generic linux-image-generic
  printer-driver-hpcups printer-driver-hpijs unity unity-2d-common unity-2d-panel
  unity-2d-shell unity-2d-spread unity-common unity-services
The following packages will be upgraded:
  accountsservice acpi-support activity-log-manager-common
  activity-log-manager-control-center apport apport-gtk apport-symptoms
539 upgraded, 0 newly installed, 0 to remove and 20 not upgraded.
Need to get 256 MB of archives.
After this operation, 26.2 MB of additional disk space will be used.
Do you want to continue [Y/n]?

```

Show by Installed Size 

```

# dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n

```

