#### E-mail notification while SSH login in VPS servers Using Gmail forwarder

* Install the mail package using 

```
# sudo apt-get install exim4 -y
```

* Configure using 

```
# sudo dpkg-reconfigure exim4-config
```

* Choose General type of mail configuration: mail sent by smarthost; received via SMTP or fetchmail

* System mail name: "your VPS hostname"

* IP-address to listen on for incoming SMTP connections: 127.0.0.1

* Other destinations for which mail is accepted: "your VPS hostname"

* Machines to relay mail for: "Just leave it blank"

* IP address or host name of the outgoing smarthost: smtp.gmail.com::587

* Hide local mail name in outgoing mail?

```
Yes - all outgoing mail will appear to come from your gmail account
No - mail sent with a valid sender name header will keep the sender’s name
```

* Keep number of DNS-queries minimal (Dial-on-Demand)? No

* Delivery method for local mail: "Our Chooise"

* Split configuration file into small files? Yes 


* Edit the configuration of passwd.client under

```
# sudo vim /etc/exim4/passwd.client
```

Append the below content with your email id and password


```
gmail-smtp.l.google.com:"my-email-address":"mypassword"
*.google.com:"my-email-address":"mypassword"
smtp.gmail.com:"my-email-address":"mypassword"
```

* Update the config Using 

```
# sudo update-exim4.conf
```

* Restart the exim4 Service using.


```
# sudo /etc/init.d/exim4 restart
```

* Send a mail and check using.

```
mail my-email-address@mydomain.com
```
Or 

```
# echo "test mail from VPS." | mail -s Test devops@yourdomain.com
```

* Check for logs under if error occured.

```
# sudo tail -f /var/log/exim4/mainlog
```

* To set a SSH notification we have to do the below steps.

Edit the file .bashrc under every users home directory.


```
# sudo vim ~/.bashrc
```

Append the below setof command and save the bashrc file and exit and login again to check the mail.

```
echo 'ALERT - Sysadmin Shell Access in (Server Dedibox) on:' `date` `who` | mail -s "Alert: Sysadmin User Access from `who | cut -d'(' -f2 | cut -d')' -f1`" my-email-address@mydomain.com.
```

This will route to Gmail and send the mail to any mail domains.
