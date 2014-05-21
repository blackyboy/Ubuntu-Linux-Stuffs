How to fix “username is not in the sudoers file. This incident will be reported” Error In Ubuntu


1. Reboot the computer. If Ubuntu is your primary and the only operating system in your computer, press the “Shift” button when it is booting up. This should make the Grub screen show up on your monitor. On the Grub screen, press the down button to the Recovery mode and press Enter.


2. On the next screen, select “Check all file system (will exit read only mode)”.


When you see the message “Finished, press Enter“, press Enter.

3. Next, select “Drop to root shell prompt”.

4. You will now be at the command line. Type:

```

usermod -a -G root sysadmin


```

Replace the username with your own login name.


5. That’s it. Now type “exit” and select “Resume normal boot”.


***


Follow the Steps below if u messup With sudoers file 


Do the Steps Untill 3 


```
sudo cp /etc/sudoers /etc/sudoers.backup
sudo nano /etc/sudoers

```

6. Check the following lines in the file 


```

# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults        env_reset
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d


```


7. Next save the file using 

```

# wq!

```

8. Net Change the permission to the sudoers file


```

# chmod 440 /etc/sudoers

```


9. Then Add your Username to the Sudo group


```

usermod -a -G root sysadmin


```

10. Exit the Shell and resume normal boot are restart ...



