#!/usr/bin/env bash

echo "********************************"
echo "Cloning and compiling PHP source"
echo "********************************"

git clone https://github.com/php/php-src "$HOME"/php-src
cd "$HOME"/php-src
sudo -u "$USER" ./buildconf

sudo -u "$USER" ./configure \
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

sudo -u "$USER" make

echo "**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
