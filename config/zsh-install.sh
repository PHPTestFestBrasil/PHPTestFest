#!/usr/bin/env bash

echo "**************"
echo "Installing ZSH"
echo "**************"
sudo apt-get -y --force-yes install zsh
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)" "$USER"
sudo sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/powerline/fonts "$HOME"/fonts
sudo "$HOME"/fonts/install.sh
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' "$HOME"/.zshrc
sed -i 's=:/bin:=:/bin:/sbin:/usr/sbin:=' "$HOME"/.zshrc
chsh -s "$(which zsh)" "$USER"
source ~/.bashrc