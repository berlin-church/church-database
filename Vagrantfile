# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 16.04 Xenial Xerus 64-bit as our operating system
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder "~/.ssh", "/home/ubuntu/ssh"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"
    chef.add_recipe "vim"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "packages::default"
    chef.add_recipe "redis::default"


    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'ubuntu',
          rubies: ["2.4.0"],
          global: "2.4.0"
        }]
      },
      postgresql: {
        password: {
          postgres: "postgres"
        },
        config: {
          log_rotation_age: "1d",
          log_rotation_size: "10MB",
          log_filename: "postgresql-%Y-%m-%d_%H%M%S.log"
        }
      },
      'packages-cookbook': ['git-core',
                            'curl',
                            'zlib1g-dev',
                            'build-essential',
                            'libssl-dev',
                            'libreadline-dev',
                            'libyaml-dev',
                            'libxml2-dev',
                            'libxslt1-dev',
                            'libcurl4-openssl-dev',
                            'libffi-dev',
                            'nodejs',
                            'libmagick++-dev',
                            'libgmp-dev']
    }
  end
end
