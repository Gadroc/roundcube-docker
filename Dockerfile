FROM php:5.6-apache

EXPOSE 80

RUN apt-get update && apt-get install -y \
		aspell \
		aspell-en \
		libenchant-dev \
		libicu-dev \
        libmcrypt-dev \
        libmysqlclient-dev \
        mysql-client \
        wget \
    && docker-php-ext-install pdo_mysql mcrypt mbstring intl exif zip enchant

RUN wget "https://downloads.sourceforge.net/project/roundcubemail/roundcubemail/1.1.3/roundcubemail-1.1.3-complete.tar.gz" -O roundcubemail.tar.gz && \
    tar xf roundcubemail.tar.gz -C /var/www/html --strip-components 1 && \
    rm roundcubemail.tar.gz && \
    rm -rf /var/www/html/installer && \
    rm /var/www/html/Dockerfile && \
    chown -R root:www-data /var/www/html && \
    chmod g+w /var/www/html/logs /var/www/html/temp

ADD config.inc.php /var/www/html/config/

ADD roundcube-start.sh /usr/bin/roundcube-start.sh

RUN . /etc/apache2/envvars && chown -R ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} /var/www/html/temp /var/www/html/logs

CMD ["roundcube-start.sh"]