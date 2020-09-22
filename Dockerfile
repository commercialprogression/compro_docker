FROM php:7.4

# Uncomment this section if the site root is in the web directory.
#ENV APACHE_DOCUMENT_ROOT /var/www/html/web
#RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
#RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Enable apache mods
#RUN a2enmod rewrite

# install the PHP extensions we need
RUN set -ex \
	&& buildDeps=' \
		libjpeg62-turbo-dev \
		libpng-dev \
		libpq-dev \
        libfontconfig1 \
        libxrender1 \
        fontconfig \
        libxext6 \
        xfonts-75dpi \
        xfonts-base \
        libwebp-dev \
        libwebp6 \
        webp \
        libfreetype6-dev \
		libzip-dev \
		libx11-xcb-dev \
		libxcomposite1 \
		libxcursor1 \
		libxdamage1 \
		libxi6 \
		libxtst6 \
		libnss3 \
		libcups2 \
		libxss1 \
		libxrandr2 \
		libasound2 \
		libatk1.0-0 \
		libatk-bridge2.0-0 \
		libpango-1.0-0 \
		libpangocairo-1.0-0 \
		libgtk-3-0 \
		zip \
		git \
		openssh-server \
		mariadb-server \
		unzip \
	' \
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd \
        --with-jpeg=/usr \
        --with-webp=/usr \
        --with-freetype=/usr \
	&& docker-php-ext-install -j "$(nproc)" gd pdo_mysql zip bcmath \
	&& apt-mark manual \
		libjpeg62-turbo \
		libpq5

#
# Install Node (with NPM) via package manager for Debian
#
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update \
 && apt-get install -y \
 nodejs

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# x them bugs
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html

# Fix them file permissions
RUN usermod -u 1000 www-data
