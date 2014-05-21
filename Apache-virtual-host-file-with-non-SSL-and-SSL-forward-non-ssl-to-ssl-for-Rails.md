```
<VirtualHost *:80>
  ServerName  mydomain.com
  ServerAlias files.mydomain.com
  ServerAdmin admin@mydomain.com
  DocumentRoot /var/www/html
  RewriteEngine On
  RewriteCond %{HTTP:X-Forwarded-Proto} !=https
  RewriteCond %{REQUEST_URI} !^/health_check
  RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [L]
  ErrorLog /var/log/apache2/errors.log
  LogLevel warn
  CustomLog /var/log/apache2/access.log combined
  SetEnv RAILS_ENV production
  <Directory /var/www/html
    Allow from all
    Options -MultiViews
  </Directory>
</VirtualHost>
<VirtualHost *:443>
  ServerName  mydomain.com
  ServerAlias files.mydomain.com
  ServerAdmin admin@mydomain.com
  DocumentRoot /var/www/html
  ErrorLog /var/log/apache2/errors.log
  LogLevel warn
  CustomLog /var/log/apache2/ssl_access.log combined
  SSLEngine on
  BrowserMatch "MSIE [2-6]" nokeepalive ssl-unclean-shutdown downgrade-1.0 force-response-1.0
  BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
  # the following ssl certificate files are generated for you from the ssl-cert package.
  SSLCertificateFile /etc/apache2/ssl/ssl_certificate.crt
  SSLCertificateKeyFile /etc/apache2/ssl/certificate.key
  SSLCertificateChainFile /etc/apache2/ssl/ssl_certificate-bundle.crt
  SetEnv RAILS_ENV production
  <Directory /var/www/html>
    Allow from all
    Options -MultiViews
  </Directory>
</VirtualHost>
```