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

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "UTC-3"
  else
    puts "_Info_: Plugin vagrant-timezone is not installed."
    puts "To install, run: vagrant plugin install vagrant-timezone"    
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian/contrib-jessie64"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  # Don't boot with headless mode
  vb.gui = false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network",
  auto_correct: true
  
  config.vm.network "forwarded_port", guest: 80, host: 4567,
  auto_correct: true

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
  config.vm.synced_folder ".", "/vagrant"

  #------------------------
  # Provisioning Scripts
  #  These scripts run in the order in which they appear, and setup the virtual machine (VM) for us.
  #------------------------

  # Shell script to set up swap space for this VM

  if File.exists?("config/increase-swap.sh")
    config.vm.provision :shell, :inline => "echo '   > > > running local increase-swap.sh to ensure enough memory is available, via a swap file.'"
    config.vm.provision :shell, :path => "config/increase-swap.sh",
    privileged: true
  end

  if File.exists?("config/config-locale.sh")
    config.vm.provision :shell, :inline => "echo '   > > > config-locale.'"
    config.vm.provision :shell, :path => "config/config-locale.sh",
    privileged: true
  end

  if File.exists?("config/zsh-install.sh")
    config.vm.provision :shell, :inline => "echo '   > > > installing zsh.'"
    config.vm.provision :shell, :path => "config/zsh-install.sh",
    privileged: false
  end
 
  if File.exists?("config/script-provision.sh")
    config.vm.provision :shell, :inline => "echo '   > > > script-provision.sh.'"
    config.vm.provision :shell, :path => "config/script-provision.sh",
    privileged: true
  end

  if File.exists?("config/php_clone_and_compile.sh")
    config.vm.provision :shell, :inline => "echo '   > > > PHP clone and compile.'"
    config.vm.provision :shell, :path => "config/php_clone_and_compile.sh",
    privileged: false
  end

end
