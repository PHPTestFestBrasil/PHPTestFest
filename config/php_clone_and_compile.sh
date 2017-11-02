#!/usr/bin/env bash

echo "********************************"
echo "Cloning and compiling PHP source"
echo "********************************"

git clone https://github.com/php/php-src /home/vagrant/php-src
cd /home/vagrant/php-src
sudo -u vagrant ./buildconf

sudo -u vagrant ./configure \
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

echo "**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
