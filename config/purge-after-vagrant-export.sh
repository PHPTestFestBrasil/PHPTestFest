#!/usr/bin/env bash

# Credits to:
#  - http://vstone.eu/reducing-vagrant-box-size/
#  - https://github.com/mitchellh/vagrant/issues/343

# Remove APT cache
sudo apt-get clean -y
sudo apt-get autoclean -y

# Zero free space to aid VM compression
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

# Remove bash history
sudo unset HISTFILE
sudo rm -f /root/.bash_history
sudo rm -f /home/vagrant/.bash_history

# Cleanup log files
sudo find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Whiteout root
sudo count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`; 
sudo let count--
sudo dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
sudo rm /tmp/whitespace;
 
# Whiteout /boot
sudo count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
sudo let count--
sudo dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
sudo rm /boot/whitespace;
 
sudo swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
sudo swapoff $swappart;
sudo dd if=/dev/zero of=$swappart;
sudo mkswap $swappart;
sudo swapon $swappart;
