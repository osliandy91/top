ARG APACHE_VERSION="latest"
FROM debian:${APACHE_VERSION}

ADD apache.sh /usr/bin/apache.sh
ENV VIRTUALHOST localhost

RUN usermod --non-unique --uid 1000 www-data \
    && groupmod --non-unique --gid 1000 www-data \
    && echo 'deb http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list \
    && echo 'deb-src http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install apt-utils apache2 libapache2-mod-fastcgi \
    && rm /etc/apache2/sites-enabled/* \
    && mkdir /etc/apache2/ssl \
    && chmod +x /usr/bin/apache.sh

ADD conf-available /etc/apache2/conf-available

ENTRYPOINT apache.sh
