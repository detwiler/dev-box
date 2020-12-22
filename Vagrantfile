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

  # Fedora 32
  config.vm.define "fedora-32", autostart: false do |fc32|
    fc32.vm.box = "fedora/32-cloud-base"
    fc32.vm.hostname = "fedora-32"
    fc32.vm.provision "shell", path: "provision-dnf"
    fc32.vm.provision "shell", path: "provision-pip"
  end

  # Fedora 31
  config.vm.define "fedora-31", autostart: false do |fc31|
    fc31.vm.box = "fedora/31-cloud-base"
    fc31.vm.hostname = "fedora-31"
    fc31.vm.provision "shell", path: "provision-dnf"
    fc31.vm.provision "shell", path: "provision-pip"
  end

  # Fedora 30
  config.vm.define "fedora-30", autostart: false do |fc30|
    fc30.vm.box = "fedora/30-cloud-base"
    fc30.vm.hostname = "fedora-30"
    fc30.vm.provision "shell", path: "provision-dnf"
    fc30.vm.provision "shell", path: "provision-pip"
  end

  # Fedora 29
  config.vm.define "fedora-29", autostart: false do |fc29|
    fc29.vm.box = "fedora/29-cloud-base"
    fc29.vm.hostname = "fedora-29"
    fc29.vm.provision "shell", path: "provision-dnf"
    fc29.vm.provision "shell", path: "provision-pip"
  end

  # Fedora 28
  config.vm.define "fedora-28", autostart: false do |fc28|
    fc28.vm.box = "fedora/28-cloud-base"
    fc28.vm.hostname = "fedora-28"
    fc28.vm.provision "shell", path: "provision-dnf"
    fc28.vm.provision "shell", path: "provision-pip"
  end

  # Fedora 27
  config.vm.define "fedora-27", autostart: false do |fc27|
    fc27.vm.box = "fedora/27-cloud-base"
    fc27.vm.hostname = "fedora-27"
    fc27.vm.provision "shell", path: "provision-dnf"
    fc27.vm.provision "shell", path: "provision-pip"
  end

  # CentOS 7
  config.vm.define "centos-7", autostart: false do |el7|
    el7.vm.box = "centos/7"
    el7.vm.hostname = "centos-7"
    el7.vm.provision "shell", path: "provision-yum"
  end

  # CentOS 6
  config.vm.define "centos-6", autostart: false do |el6|
    el6.vm.box = "centos/6"
    el6.vm.hostname = "centos-6"
    el6.vm.provision "shell", path: "provision-yum"
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

  # Ubuntu 2004
  config.vm.define "ubuntu-2004", autostart: false do |u2004|
    u2004.vm.box = "generic/ubuntu2004"
    u2004.vm.hostname = "ubuntu-2004"
    u2004.vm.provision "shell", path: "provision-apt"
    u2004.vm.provision "shell", path: "provision-pip"
  end

  # Ubuntu 1910
  config.vm.define "ubuntu-1910", autostart: false do |u1910|
    u1910.vm.box = "generic/ubuntu1910"
    u1910.vm.hostname = "ubuntu-1910"
    u1910.vm.provision "shell", path: "provision-apt"
    u1910.vm.provision "shell", path: "provision-pip"
  end

  # Ubuntu 1904
  config.vm.define "ubuntu-1904", autostart: false do |u1904|
    u1904.vm.box = "generic/ubuntu1904"
    u1904.vm.hostname = "ubuntu-1904"
    u1904.vm.provision "shell", path: "provision-apt"
    u1904.vm.provision "shell", path: "provision-pip"
  end

  # Ubuntu 1804
  config.vm.define "ubuntu-1804", autostart: false do |u1804|
    u1804.vm.box = "generic/ubuntu1804"
    u1804.vm.hostname = "ubuntu-1804"
    u1804.vm.provision "shell", path: "provision-apt"
    u1804.vm.provision "shell", path: "provision-pip"
  end

  # Ubuntu 1604
  config.vm.define "ubuntu-1604", autostart: false do |u1604|
    u1604.vm.box = "generic/ubuntu1604"
    u1604.vm.hostname = "ubuntu-1604"
    u1604.vm.provision "shell", path: "provision-apt"
    u1604.vm.provision "shell", path: "provision-pip"
  end

end
