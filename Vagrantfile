# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.box_version = "0"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "debian_infotecs"
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    sed -in "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    systemctl restart sshd
  SHELL
end
