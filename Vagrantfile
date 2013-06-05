# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "quantal"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/165709740/boxes/quantal64-vanilla.box"


  #set the ip address of the machine (choose a different one if it's aleady taken by another vm)
  config.vm.network :private_network, ip: "172.16.0.2"

  config.vm.provision :shell, :path => "provisioners/shell/librarian-puppet.sh"

  config.vm.provision :puppet do |puppet|

    puppet.facter = { "fqdn" => "vagrant-setup.local", "hostname" => "vagrant-setup" }
    puppet.manifests_path = "provisioners/puppet/manifests"
    puppet.manifest_file  = "default.pp"

    # puppet.options = [
    # '--verbose',
    # '--debug',
    # ]

  end
end
