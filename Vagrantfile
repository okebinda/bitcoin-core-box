# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root", nfs: true
  config.vm.provision :shell, path: "provision/bootstrap.sh"
  
  config.vm.hostname = "bitcoin-dev"
  config.vm.network :private_network, ip: "172.29.1.20"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Bitcoin-DEV"
    vb.memory = 4096
  end

end
