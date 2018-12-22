FROM php:7.2-apache

EXPOSE 80

ENV PACKAGES="aspell aspell-en enchant mysql-client unzip"
ENV BUILD_PACKAGES="libenchant-dev libicu-dev default-libmysqlclient-dev wget"

RUN . /etc/apache2/envvars && \
    apt-get update && \
    apt-get install -y  $PACKAGES $BUILD_PACKAGES && \
    docker-php-ext-install pdo_mysql mbstring intl exif zip enchant && \
    wget "https://github.com/roundcube/roundcubemail/releases/download/1.3.8/roundcubemail-1.3.8.tar.gz" -O roundcubemail.tar.gz && \
    tar xf roundcubemail.tar.gz -C /var/www/html --strip-components 1 && \
    rm roundcubemail.tar.gz && \
    chown -R root:www-data /var/www/html && \
    chmod g+w /var/www/html/logs /var/www/html/temp && \
    chown -R ${APACHE_RUN_USER}:${APACHE_RUN_GROUP} /var/www/html/temp /var/www/html/logs && \
    pear install Net_SMTP && \
    pear install Mail_mime && \
    pear install Net_Sieve && \
    /var/www/html/bin/install-jsdeps.sh && \
    apt-get autoremove --purge -y $BUILD_PACKAGES && \
    rm -rf /var/lib/apt/lists/*

ADD imagefiles/* /

CMD ["roundcube-start.sh"]