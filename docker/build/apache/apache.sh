#! /bin/bash

a2enmod proxy
a2enmod proxy_fcgi
a2enmod rewrite
a2enmod ssl
a2enmod env
a2enmod actions
a2enmod headers
a2enmod cgi
a2enconf servername
a2ensite 000-default

/usr/sbin/apache2ctl -D FOREGROUND
