# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # libvirt provider
  config.vm.provider :libvirt do |lv|
    lv.memory = 8192
    lv.cpus = 4
  end

  # ssh settings
  config.ssh.keys_only = true
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"

  # disable default synced folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # vagrant-hostmanager plugin
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  end

  # Configure multiple VMs

  # Fedora 33
  config.vm.define "fedora-33", autostart: false do |fc33|
    fc33.vm.box = "fedora/33-cloud-base"
    fc33.vm.hostname = "fedora-33"
    fc33.vm.provision "shell", path: "provision-dnf"
    fc33.vm.provision "shell", path: "provision-pip"
  end

  # Alpine 3.12
  config.vm.define "alpine-312", autostart: false do |u312|
    u312.vm.box = "generic/alpine312"
    u312.vm.hostname = "alpine-312"
    u312.vm.provision "shell", path: "provision-apk"
    u312.vm.provision "shell", path: "provision-pip"
  end

  # Ubuntu 2010
  config.vm.define "ubuntu-2010", autostart: false do |u2010|
    u2010.vm.box = "generic/ubuntu2010"
    u2010.vm.hostname = "ubuntu-2010"
    u2010.vm.provision "shell", path: "provision-apt"
    u2010.vm.provision "shell", path: "provision-pip"
  end

end
