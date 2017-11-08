#!/usr/bin/env bash

echo "********************************"
echo "Cloning and compiling PHP source"
echo "********************************"

export PHP_INI_DIR=/vagrant/config/php
if [ ! -f $PHP_INI_DIR/conf.d ]; then
    sudo mkdir -p $PHP_INI_DIR/conf.d
fi

export gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"

export PHP_INI_DIR=/vagrant/config/php
if [ ! -e /home/vagrant/php-src ]; then
    git clone https://github.com/php/php-src /home/vagrant/php-src
fi

cd /home/vagrant/php-src
sudo -u vagrant ./buildconf

sudo -u vagrant ./configure \
    --build="$gnuArch" \
    --with-config-file-path="$PHP_INI_DIR" \
    --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
    --enable-gcov \
    --with-xsl \
    --enable-wddx \
    --with-tidy \
    --enable-soap \
    --with-bz2 \
    --with-imap \
    --with-imap-ssl \
    --with-kerberos \
    --with-mysqli=mysqlnd \
    --with-openssl \
    --with-pdo-mysql=mysqlnd \
    --with-pdo-sqlite \
    --with-pgsql \
    --with-pdo-pgsql \
    --with-zlib \
    --enable-bcmath \
    --enable-calendar \
    --enable-dba \
    --enable-exif \
    --enable-ftp \
    --with-gd \
    --with-gmp \
    --enable-pcntl \
    --enable-shmop \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --with-xmlrpc \
    --with-snmp \
    --enable-mbstring \
    --with-gdbm \
    --with-pdo-firebird \
    --with-gettext \
    --with-readline \
    --enable-intl \
    --with-mhash \
    --with-unixODBC=/usr \
    --with-pdo-odbc=unixODBC,/usr \
    --with-pdo-dblib \
    --with-litespeed \
    --with-interbase \
    --with-pcre-valgrind \
    --enable-debug \
    --enable-sigchild \
    --enable-libgcc \
    --with-pcre-regex \
    --enable-gd-jis-conv \
    --with-onig \
    --with-mm \
    --enable-zip \
    --with-libedit \
    --enable-phpdbg \
    --enable-fpm \
    --without-pear \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --without-libzip \
    --with-zlib-dir=/usr \
    --enable-xmlreader \
    --with-curl=/usr \
    --with-pspell=/usr \
    --with-enchant=/usr \
    --with-freetype-dir=/usr \
    --with-xpm-dir=/usr \
    --enable-zend-test


sudo -u vagrant make

echo "\n**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
