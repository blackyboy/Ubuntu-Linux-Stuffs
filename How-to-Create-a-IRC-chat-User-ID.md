Here we can see how to create a IRC chat username and password

This is the Procedure for creating a IRC Free-node Chat registration for IRC

* To check for a nick


```
/msg nickserv help identify
```


* choosing your nickname


```
/nick your_favorite_nickname
```

* Register my nickname


```
/msg nickserv register password_of_your_choice your@email.address
```

Note:> Then go to the email id used here and check for mail and confirm the link then only u can login using your created login


* To Delete a Nickname


```
 /msg nickserv drop NICK PASSWORD
```

* changing accountname.


```
/msg nickserv set accountname NEWNAME
```

* Adding more nicks to one account


```
/msg nickserv group
```

* change my password


```
/msg nickserv set password NEWPASSWORD
```

* To see someones NickServ-username


```
/whois NICKNAME
```

* Someone has taken my nick how to recover.
  If someone is using your nick, you can use the GHOST-command to disconnect that user.


```
 /msg nickserv ghost NICK PASSWORD (if you are not logged in)
 /msg nickserv ghost NICK (if you are already logged in)
```

* I can't use my nick, but nobody is using it!


```
/msg nickserv regain NICKNAME PASSWORD (when you are not logged in)
/msg nickserv regain NICKNAME (when you are already logged in)
```

####Troubleshooting:

* If we get nickname temporarily unavailable.


  Connect as normal with your irc-client
* Identify to your nick:


```
/quote NickServ identify nickname password
```

* Turn off the old nick enforcer


```
/quote NickServ set enforce OFF
```


* You might need to release your nick from being held by services:


```
/quote NickServ release nickname password
```

------------------------x-----------------------x---------------------
