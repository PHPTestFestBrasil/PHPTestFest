#!/bin/bash
echo "**********************"
echo "apt-spy-2-bootstrap.sh"
echo "**********************"
# apt-spy-2-bootstrap.sh
# Uses the Ruby gem apt-spy2 to ensure the apt sources.list file is configured appropriately for this location, and that it selects mirrors that are currently functional

# Do the initial apt-get update
echo "Initial apt-get update..."
apt-get update >/dev/null

echo "Installing 'apt-spy2'. This tool lets us autoconfigure your 'apt' sources.list to a nearby location."
echo "  This may take a while..."

# Ensure dependencies are installed (These are needed to dynamically determine your country code).
# (Note: ruby >= 1.9.2 is needed for apt-spy2)
apt-get install -y ruby1.9.3 curl geoip-bin >/dev/null

# figure out the two-letter country code for the current locale, based on IP address
# (Only return something that looks like an IP address: i.e. ###.###.###.###)
export CURRENTIP=`curl -s http://ipecho.net/plain | grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`

export COUNTRY=`geoiplookup $CURRENTIP | awk -F:\  '{print $2}' | sed 's/,.*//'`

#If country code is empty or != 2 characters, then use "US" as a default
if [ -z "$COUNTRY" ] || [ "${#COUNTRY}" -ne "2" ]; then
   COUNTRY = "BR"
fi

if [ "$(gem search -i apt-spy2)" = "false" ]; then
  gem install apt-spy2
  echo "... apt-spy2 installed!"
  echo "... Setting 'apt' sources.list for closest mirror to country=$COUNTRY"
  apt-spy2 fix --launchpad --commit --country=$COUNTRY ; true
else
  echo "... Setting 'apt' sources.list for closest mirror to country=$COUNTRY"
  apt-spy2 fix --launchpad --commit --country=$COUNTRY ; true
fi

echo "*************************"
echo "Updating system packages"
echo "*************************"

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get -y update
sudo apt-get -y upgrade
sudo locale-gen pt_BR.UTF-8

echo "******************************"
echo "Installing supporting packages"
echo "******************************"

sudo apt-get -y install build-essential wget curl git vim
sudo apt-get -y install libcurl4-gnutls-dev libreadline-dev libxml2-dev libxslt1-dev re2c libpng-dev libjpeg-dev m4 lcov libicu-dev
sudo apt-get -y install sublime-text-installer

echo "*********************"
echo "Installing oh-my-zsh"
echo "*********************"

sudo apt-get -y install zsh
sudo su - vagrant -c 'curl -L http://install.ohmyz.sh | zsh'
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' /home/vagrant/.zshrc
sudo sed -i 's=:/bin:=:/bin:/sbin:/usr/sbin:=' /home/vagrant/.zshrc
chsh vagrant -s $(which zsh);

echo "****************************"
echo "Installing php5 dev packages"
echo "****************************"

sudo apt-get -y install php5-dev php-pear

echo "*********************************"
echo "Installing bison required version"
echo "*********************************"

wget http://launchpadlibrarian.net/140087287/libbison-dev_2.7.1.dfsg-1_i386.deb
wget http://launchpadlibrarian.net/140087286/bison_2.7.1.dfsg-1_i386.deb
sudo dpkg -i libbison-dev_2.7.1.dfsg-1_i386.deb
sudo dpkg -i bison_2.7.1.dfsg-1_i386.deb
rm -rf libbison-dev_2.7.1.dfsg-1_i386.deb
rm -rf bison_2.7.1.dfsg-1_i386.deb

echo "******************"
echo "Cloning PHP source"
echo "******************"
git clone https://github.com/php/php-src /home/vagrant/php-src
cd /home/vagrant/php-src
./buildconf
./configure --with-curl --with-gd --with-mhash --with-pdo-mysql --enable-soap --with-openssl --with-xsl --enable-bcmath --with-zlib --enable-sysvsem --with-gd --with-readline --enable-gcov --enable-phar --enable-mbstring
make

echo "**********************************************************"
echo "All requirements were installed. You can start your tests!"
echo "**********************************************************"
