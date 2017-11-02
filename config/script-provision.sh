#!/usr/bin/env bash

echo "******************************"
echo "Installing supporting packages"
echo "******************************"

sudo apt-get update -y

sudo apt-get -y --force-yes install \
	build-essential \
	wget \
	curl \
	git \
	vim \
	autoconf \
	software-properties-common \
	mm-common \
	libcurl4-gnutls-dev \
	libreadline-dev \
	libxslt1-dev \
	re2c \
	libpng-dev \
	libjpeg-dev \
	m4 \
	lcov \
	libicu-dev \
    libc-bin \
    tzdata \
    initscripts \
    libedit2 \
    libonig2 \
    libqdbm14


echo "************************************"
echo "Installing other supporting packages"
echo "************************************"
sudo apt-get -y --force-yes install \
    bison \
    snmp \
    libbison-dev \
    libxml2-dev \
    libevent-dev \
    zlib1g-dev \
    libbz2-dev \
    libgmp3-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng-dev \
    libxpm-dev \
    libgd2-xpm-dev \
    libmcrypt-dev \
    memcached \
    libmemcached-dev \
    libpcre3-dev \
    libc-client-dev \
    libkrb5-dev \
    libsasl2-dev \
    libmysqlclient-dev \
    libpspell-dev \
    libsnmp-dev \
    libxslt-dev \
    libtool \
    libc-client2007e \
    libc-client2007e-dev \
    libenchant-dev \
    libgmp-dev \
    librecode-dev \
    libmm-dev \
    libmm14 \
    libzip-dev \
    libedit-dev

sudo ln -fs /usr/include/linux/igmp.h /usr/include/gmp.h
sudo ln -fs /usr/lib/i386-linux-gnu/libldap.so /usr/lib/
