FROM php:8.1-fpm

# extensions installed by image:
# xml, tokenizer, openssl, mbstring, json, fileinfo, ctype,

# install missing base laravel extensions:
# bcmath
RUN docker-php-ext-install \
        bcmath

# install exif extension
RUN docker-php-ext-install \
        exif

# install mysql extensions
# mysqli, pdo_mysql
RUN docker-php-ext-install \
        mysqli \
        pdo_mysql

# install gd extension
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        gd

# install zip extension
RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
    && docker-php-ext-install \
        zip

# install imagick extension
RUN apt-get update && apt-get install -y \
        libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable \
        imagick

# install redis extension
RUN pecl install redis \
    && docker-php-ext-enable \
        redis

# install xdebug extension
RUN pecl install xdebug \
    && docker-php-ext-enable \
        xdebug

# install packages for composer and node
# curl, unzip, git
RUN apt-get update && apt-get install -y \
        curl \
        unzip \
        git

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install node with npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install nodejs build-essential -y

# clean
RUN apt-get clean \
    && rm -rf /var/lib/apt-get/lists/* /tmp/* /var/tmp/* /var/cache/*

# add deploy script
ADD deploy.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin/deploy.sh

# setup user
RUN apt-get update && apt-get install -y \
    sudo

ARG USERNAME
ARG USER_ID
ARG GROUP_ID

RUN groupadd -g $GROUP_ID -o $USERNAME
RUN useradd -m -u $USER_ID -g $GROUP_ID -o -s /bin/bash $USERNAME

RUN usermod -aG www-data $USERNAME
RUN usermod -aG sudo $USERNAME

RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

USER $USERNAME

# setup path to global composer packages
RUN echo "export PATH=\"$PATH:$HOME/.composer/vendor/bin\"" > $HOME/.bashrc

# install PHP CS Fixer
RUN composer global require friendsofphp/php-cs-fixer
