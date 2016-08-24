FROM php:5.6-apache

# Enable apache mods
RUN a2enmod rewrite

# Install packages and PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

  RUN yes | pecl install xdebug \
      && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
      && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
      && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
      
# Fix them file permissions
RUN usermod -u 1000 www-data

# Set the working directory
WORKDIR /var/www/html
