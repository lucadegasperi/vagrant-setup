# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # set the ip address of the machine (choose a different one if it's aleady taken by another vm)
  config.vm.network :private_network, :ip => "172.16.0.2"

  # set the right owner and permissions for the storage folders
  config.vm.synced_folder "app/storage", "/vagrant/app/storage", :owner => 'www-data', :group => 'www-data', :mount_options => ["dmode=777", "fmode=777"]

  # set the timezone
  config.vm.provision :shell, :inline => "echo \"Europe/Rome\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # provision the vm with puppet
  config.vm.provision :puppet do |puppet|

    puppet.facter = { 
      "fqdn" => "vagrant-setup.local",
    }

    puppet.manifests_path = "vagrant/provisioners/puppet/manifests"
    puppet.manifest_file  = "default.pp"
    puppet.module_path    = "vagrant/provisioners/puppet/modules"
    #puppet.options = "--verbose --debug"
    #puppet.options = "--verbose"
  end
end
