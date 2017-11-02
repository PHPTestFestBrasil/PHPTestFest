#!/usr/bin/env bash

vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-rsync-back
vagrant plugin install vagrant-timezone
vagrant up
vagrant ssh