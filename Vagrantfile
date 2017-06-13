# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  else
    puts "_Info_: Plugin vagrant-cachier is not installed."
    puts "To install, run: vagrant plugin install vagrant-cachier"
  end

  unless Vagrant.has_plugin?("vagrant-rsync-back")
    puts "_Info_: Plugin vagrant-rsync-back is not installed."
    puts "To install, run: vagrant plugin install vagrant-rsync-back"
  end

  unless Vagrant.has_plugin?("vagrant-vbguest")
    puts "_Info_: Plugin vagrant-vbguest is not installed."
    puts "To install, run: vagrant plugin install vagrant-vbguest"
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "arnemertz/Xubuntu16.04"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1536"]
  end


  if Vagrant.has_plugin?("vagrant-vbguest")
    # set auto_update to false, if you do NOT want to check the correct 
    # additions version when booting this machine
    config.vbguest.auto_update = true
    # do NOT download the iso file from a webserver
    config.vbguest.no_remote = false
  end

  #config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", :nfs => true
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__auto: true
   
  config.vm.network :private_network, ip: "192.168.33.99"
  config.vm.network "forwarded_port", guest: 8042, host: 8042, auto_correct: true

  config.vm.provision "shell", path: "script-provision.sh"
end
