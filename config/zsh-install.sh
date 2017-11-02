#!/usr/bin/env bash

echo "**************"
echo "Installing ZSH"
echo "**************"
sudo apt-get -y --force-yes install zsh
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)" "$USER"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' "$HOME"/.zshrc
sed -i 's=:/bin:=:/bin:/sbin:/usr/sbin:=' "$HOME"/.zshrc
chsh -s "$(which zsh)" "$USER"
source ~/.zshrc