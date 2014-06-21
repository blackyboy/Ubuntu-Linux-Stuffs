How to add subdomains in canvas websites for testing purpose

* First to add a Subdomain we need to navigate to the Project directory

```
ex: cd dev/tags/canvas_project/
```

* Then Run the following command in Terminal to add the subdomain's

```
RAILS_ENV=production bundle exec rake db:add_account
```

* Then give the Account name and email address, and password to add a NEW Subdomains

```
Enter  Account name > test5
You want to Disable Kaltura ? (y/n) > n
You want to Disable Big Blue Button ? (y/n) > n
You want to Disable Grade ? (y/n) > n
You want to Disable Outcomes ? (y/n) > n
You want to Disable course content import ? (y/n) > n
You want to Disable course content export ? (y/n) > n
You want to Enable Private Course licence ? (y/n) > n
Creating Account test5... 
What email address will the site administrator account use? > test5@testserver.com
Please confirm > test5@testserver.com
What password will the site administrator use? > *********
Please confirm > *********

test5@testserver.com user created
Successfully created admin user with email: test5@testserver.com, password: admin123$ for account: test5
```
* Then navigate to the newly created domains in browser's

------------------------x-----------------------x----------------------
