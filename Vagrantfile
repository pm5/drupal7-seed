# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vm.box = "debian/contrib-jessie64"
  #config.vm.box = "debian/wheezy64"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, type: "dhcp"

  # Vagrant 1.7+ automatically inserts a different
  # insecure keypair for each new VM created. The easiest way
  # to use the same keypair for all the machines is to disable
  # this feature and rely on the legacy insecure key.
  #
  # Note:
  # As of Vagrant 1.7.3, it is no longer necessary to disable
  # the keypair creation when using the auto-generated inventory.
  config.ssh.insert_key = false

  config.vm.define "web", primary: true do |web|
    web.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "drupal_web",
        "--memory", "1024"
      ]
    end
    web.vm.hostname = "web"
    web.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
    web.vm.synced_folder "docroot", "/var/www", :nfs => true
    web.vm.synced_folder "logs/web", "/var/log",
      owner: "vagrant",
      group: "www-data",
      mount_options: ["dmode=775,fmode=664"]
  end

  config.vm.define "db" do |db|
    db.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "drupal_db",
        "--memory", "1024"
      ]
    end
    db.vm.hostname = "db"
    db.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true
    db.vm.network :forwarded_port, guest: 5432, host: 5432, auto_correct: true
    db.vm.network :forwarded_port, guest: 11211, host: 11211, auto_correct: true

    db.vm.synced_folder "logs/db", "/var/log",
      owner: "vagrant",
      group: "www-data",
      mount_options: ["dmode=775,fmode=664"]

    db.vm.provision :ansible do |ansible|
      # provision in parallel
      ansible.limit = "all"
      ansible.playbook = "playbooks/vagrant.yml"
      ansible.groups = {
        "webservers" => ["web"],
        "codeservers" => ["web"],
        "fileservers" => ["db"],
        "dbservers" => ["db"],
        "cacheservers" => ["db"],
        "all:children" => ["web", "db"]
      }
      ansible.host_key_checking = false
    end
  end

end
