#!/bin/bash

echo "*************************"
echo "Updating system packages"
echo "*************************"

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo locale-gen pt_BR.UTF-8
sudo apt-get update -y
sudo apt-get install -f -y

echo "******************************"
echo "Installing supporting packages"
echo "******************************"

sudo apt-get -f -y install build-essential wget curl git vim autoconf software-properties-common mm-common
sudo apt-get -f -y install libcurl4-gnutls-dev libreadline-dev libxml2-dev libxslt1-dev re2c libpng-dev libjpeg-dev m4 lcov libicu-dev
sudo apt-get -f -y install sublime-text-installer

echo "*********************"
echo "Installing oh-my-zsh"
echo "*********************"

sudo apt-get -f -y install zsh
sudo su - vagrant -c 'curl -L http://install.ohmyz.sh | zsh'
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' /home/vagrant/.zshrc
sudo sed -i 's=:/bin:=:/bin:/sbin:/usr/sbin:=' /home/vagrant/.zshrc
chsh vagrant -s $(which zsh);

echo "****************************"
echo "Installing php7 dev packages"
echo "****************************"

sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/php-qa
sudo apt-get update -y
sudo apt-get install -y libapache2-mod-php7.1 php7.1-fpm php7.1-common php7.1-cli php-pear php7.1-curl php7.1-gd php7.1-gmp php7.1-intl php7.1-imap php7.1-json php7.1-ldap php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-ps php7.1-readline php7.1-tidy php7.1-xmlrpc php7.1-xsl
sudo apt-get --purge autoremove

echo "************************************"
echo "Installing other supporting packages"
echo "************************************"
sudo apt-get -f -y install m4 bison libbison-dev libxml2-dev libevent-dev zlib1g-dev libbz2-dev libgmp3-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libgd2-xpm-dev libmcrypt-dev memcached libmemcached-dev libpcre3-dev libc-client-dev libkrb5-dev libsasl2-dev libmysqlclient-dev libpspell-dev libsnmp-dev libxslt-dev libtool libc-client2007e libc-client2007e-dev libenchant-dev libgmp-dev librecode-dev libmm-dev libmm14 libzip-dev snmp snmp-mibs-downloader libedit-dev
sudo ln -fs /usr/include/linux/igmp.h /usr/include/gmp.h
sudo ln -fs /usr/lib/i386-linux-gnu/libldap.so /usr/lib/

echo "********************************"
echo "Cloning and compiling PHP source"
echo "********************************"
sudo -u vagrant git clone https://github.com/php/php-src /home/vagrant/php-src
cd /home/vagrant/php-src
sudo -u vagrant ./buildconf
sudo -u vagrant ./configure --enable-gcov --enable-debug --enable-sigchild --enable-libgcc --with-openssl --with-kerberos --with-pcre-regex --enable-bcmath --with-bz2 --enable-calendar --with-curl --with-enchant --enable-exif --enable-ftp --with-gd --enable-gd-jis-conv --with-gettext --with-mhash --with-kerberos --with-imap-ssl --enable-intl --enable-mbstring --with-libmbfl --with-onig --with-pspell --with-recode --with-mm --enable-shmop --with-snmp --enable-soap --enable-sockets --enable-sysvsem --enable-wddx --with-xmlrpc --with-xsl --enable-zip --with-zlib --with-readline --with-libedit
sudo -u vagrant make

echo "**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
