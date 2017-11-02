#!/usr/bin/env bash

echo "**************"
echo "Installing ZSH"
echo "**************"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
sudo apt-get -y --force-yes install git zsh
sudo rm -rf /root/.oh-my-zsh/
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)" "vagrant"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' /home/vagrant/.zshrc
sed -i 's=:/bin:=:/bin:/sbin:/usr/sbin:=' /home/vagrant/.zshrc
chsh -s "$(which zsh)" vagrant
source ~/.zshrc