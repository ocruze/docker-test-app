# php.dockerfile
FROM php:7.3-apache

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV http_proxy http://proxy.ign.fr:3128
ENV https_proxy http://proxy.ign.fr:3128
ENV HTTP_PROXY http://proxy.ign.fr:3128
ENV HTTPS_PROXY http://proxy.ign.fr:3128

# git, unzip & zip are for composer
RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    gnupg \
    unzip \
    make \
    zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# PHP Extensions
RUN apt-get update
COPY docker-config/php.ini /usr/local/etc/php/conf.d/app.ini

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Apache
COPY docker-config/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY docker-config/apache.conf /etc/apache2/conf-available/z-app.conf

RUN a2enmod rewrite remoteip && \
    a2enconf z-app