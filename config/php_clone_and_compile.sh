#!/usr/bin/env bash

echo "********************************"
echo "Cloning and compiling PHP source"
echo "********************************"

export PHP_INI_DIR=/vagrant/config/php
if [ ! -f $PHP_INI_DIR/conf.d ]; then
    sudo mkdir -p $PHP_INI_DIR/conf.d
fi

export gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"

git clone https://github.com/php/php-src /vagrant/php-src
cd /vagrant/php-src
sudo -u vagrant ./buildconf

sudo -u vagrant ./configure \
    --build="$gnuArch" \
    --with-config-file-path="$PHP_INI_DIR" \
    --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
    --enable-gcov \
    --enable-debug \
    --enable-sigchild \
    --enable-libgcc \
    --with-openssl \
    --with-kerberos \
    --with-pcre-regex \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --with-curl \
    --with-enchant \
    --enable-exif \
    --enable-ftp \
    --with-gd \
    --enable-gd-jis-conv \
    --with-gettext \
    --with-mhash \
    --with-kerberos \
    --with-imap-ssl \
    --enable-intl \
    --enable-mbstring \
    --with-onig \
    --with-pspell \
    --with-recode \
    --with-mm \
    --enable-shmop \
    --with-snmp \
    --enable-soap \
    --enable-sockets \
    --enable-sysvsem \
    --enable-wddx \
    --with-xmlrpc \
    --with-xsl \
    --enable-zip \
    --with-zlib \
    --with-readline \
    --with-libedit

sudo -u vagrant make

echo "\n**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
