#!/usr/bin/env bash

echo "*******************"
echo "Configuring locales"
echo "*******************"

#Adds a locale to a debian system in non-interactive mode
apt-get -y --force-yes install locales
locale-gen --purge en_US.UTF-8
sed -i '/^#.* en_US.* /s/^#//' /etc/locale.gen
locale-gen
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
source ~/.bashrc
