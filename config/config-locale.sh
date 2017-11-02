#!/usr/bin/env bash

echo "*******************"
echo "Configuring locales"
echo "*******************"

#Adds a locale to a debian system in non-interactive mode
sudo apt-get -y --force-yes install locales
sudo locale-gen --purge en_US.UTF-8
sudo sed -i '/^#.* en_US.* /s/^#//' /etc/locale.gen
sudo locale-gen
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
source ~/.bashrc
