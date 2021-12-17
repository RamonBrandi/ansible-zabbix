machines = {
  "server-1"   => {"memory" => "1024", "cpu" => "1", "ip" => "100"},
  "server-2"   => {"memory" => "1024", "cpu" => "1", "ip" => "110"},
  "server-3"   => {"memory" => "1024", "cpu" => "1", "ip" => "120"},
  "server-4"  => {"memory" => "1024", "cpu" => "1", "ip" => "130"},
}

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "ubuntu/bionic64"
      machine.vm.network "private_network", ip: "10.20.20.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/teste-empresa"]
      end
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "echo ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"
    end
end
end