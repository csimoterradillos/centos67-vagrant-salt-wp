# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant Box
  config.vm.box = "centos67"
  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.6.7/vagrant-centos-6.7.box"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
  ### CJST
  ### Pedimos que vagrant utilice el usuario root
  ### Necesitamos root para poder poner en directorios tales como /etc/salt el fichero minion aprovisionado localmente
  config.ssh.username = "root"
  config.ssh.password = "vagrant"

  ### CJST
  ### Fijar el router por defecto para habilitar la transferencia desde Internet ficheros como wordpress
  config.vm.provision "shell",
   run: "always",
   inline: "route add default gw 10.0.2.2"

  # Salt Provisioner
  config.vm.provision :salt do |salt|

    ### CJST: Segun la documentacion de Vagrant es imprescindible
    ### indicar explicitamente que se va a trabajar con salt sin master, como es el caso
    salt.masterless = true

    # Relative location of configuration file to use for minion
    # since we need to tell our minion to run in masterless mode
    salt.minion_config = "saltstack/etc/minion"

    # On provision, run state.highstate (which installs packages, services, etc).
    # Highstate basicly means "comapre the VMs current machine state against 
    # what it should be and make changes if necessary".
    salt.run_highstate = true
    
    # What version of salt to install, and from where.
    # Because by default it will install the latest, its better to explicetly
    # choose when to upgrade what version of salt to use.

    # I also prefer to install from git so I can specify a version.
    salt.install_type = "git"
    ### CJST: No parece funcionar correctamente la version indicada
    ### salt.install_args = "v2014.1.0"

    # Run in verbose mode, so it will output all debug info to the console.
    # This is nice to have when you are testing things out. Once you know they
    # work well you can comment this line out.
    salt.verbose = true
  end
end
