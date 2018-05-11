Vagrant.configure("2") do |config|
  config.vm.boot_timeout = 10800
  config.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
  config.vm.box_version = "2017.07.21"
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.provision "file", source: "bootstrap.sh", destination: "bootstrap.sh"
  config.ssh.shell = "sh"
  config.vm.base_mac = "080027D14C66"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    end
end
