# -*- mode: ruby -*-
# vi: set ft=ruby :

#require "vagrant/commands/artisan.rb"
#require "vagrant/commands/composer.rb"

Vagrant.configure("2") do |config|
  
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  # set the ip address of the machine (choose a different one if it's aleady taken by another vm)
  config.vm.network :private_network, :ip => "172.16.0.2"

  # set the timezone
  config.vm.provision :shell, :inline => "echo \"Europe/Rome\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # provision the vm with puppet
  config.vm.provision :puppet do |puppet|

    puppet.facter = { 
      "fqdn" => "vagrant-setup.local", 
      "hostname" => "vagrant-setup",
      "docroot" => "/vagrant",
    }

    puppet.manifests_path = "vagrant/provisioners/puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "vagrant/provisioners/puppet/modules"

    #puppet.options = [
    #  '--verbose',
    #  '--debug',
    #]

  end
end
