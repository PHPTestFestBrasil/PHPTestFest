#!/usr/bin/env bash

echo "******************************"
echo "Installing supporting packages"
echo "******************************"

sudo apt-get update -y

sudo apt-get -y --force-yes install \
    file \
    g++ \
    gcc \
    libc-dev \
    libpcre3-dev \
    make \
    autoconf \
    pkg-config \
    re2c \
    libedit2 \
    libsqlite3-0 \
    libxml2 \
    xz-utils \
    build-essential \
    wget \
    curl \
    git \
    vim \
    software-properties-common \
    locales \
    libgmp-dev \
    libicu-dev \
    libtidy-dev \
    libenchant-dev \
    libaspell-dev \
    libpspell-dev \
    librecode-dev \
    libsasl2-dev \
    libxpm-dev \
    libzip-dev \
    mm-common \
    libssl-dev \
    libreadline-dev \
    libxslt1-dev \
    libpng-dev \
    libjpeg-dev \
    m4 \
    lcov \
    libc-bin \
    tzdata \
    initscripts \
    libonig2 \
    libqdbm14 \
    bison \
    snmp \
    libxml2-dev \
    libevent-dev \
    zlib1g-dev \
    libbz2-dev \
    libgmp3-dev \
    libgd2-xpm-dev \
    libmcrypt-dev \
    memcached \
    libmemcached-dev \
    libc-client-dev \
    libkrb5-dev \
    libmysqlclient-dev \
    libsnmp-dev \
    libxslt-dev \
    libtool \
    libc-client2007e \
    libc-client2007e-dev \
    libmm-dev \
    libmm14 \
    libedit-dev \
    libbison-dev \
    dpkg-dev \
    libpq-dev \
    postgresql \
    unixODBC \
    unixODBC-dev \
    valgrind \
    libdb-dev \
    libgdm-dev \
    libgdbm-dev \
    libfbclient2 \
    firebird-dev \
    ldap-utils \
    libldap-dev \
    freetds-dev



sudo ln -fs /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/libsybdb.so
sudo ln -fs /usr/include/linux/igmp.h /usr/include/gmp.h
sudo ln -fs /usr/lib/i386-linux-gnu/libldap.so /usr/lib/

sudo apt-get -y --force-yes install \
    libcurl4-gnutls-dev
