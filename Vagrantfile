# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.network "private_network", ip: "192.168.42.11"
	config.vm.box = "debian/stretch64"
	config.disksize.size = '20GB'
	config.vm.box_version = "9.4.0"
	config.vm.hostname = "deb-go-vbox"
	config.vm.provider "virtualbox" do |vb|
		vb.name = "deb-go-vbox"

		# Adjust to about half of your system's memory; value is in MB.
		vb.memory = "10240"

		# Adjust to half of your system's cpu cores.
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		vb.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "on"]
		vb.customize ["modifyvm", :id, "--vram", "128"]
		vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
		vb.customize ["storageattach", :id,
                "--storagectl", "SATA Controller",
                "--port", "1", "--device", "0",
                "--type", "dvddrive",
                "--medium", "emptydrive"]
		vb.gui = true
	end

	config.vm.provision "file", source: "resources/sshd_config", destination: "sshd_config"
	# config.vm.provision "file", source: "resources/VBoxGuestAdditions.iso", destination: "VBoxGuestAdditions.iso"

	config.vm.provision "shell", path: "scripts/ssh.sh"
	config.vm.provision "shell", path: "scripts/base-pkgs.sh"
	config.vm.provision "shell", path: "scripts/golang.sh"
	config.vm.provision "shell", path: "scripts/docker-ce.sh"
	# config.vm.provision "shell", path: "scripts/k8s.sh"
	config.vm.provision "shell", path: "scripts/desktop.sh"
	config.vm.provision "shell", path: "scripts/vscode.sh"

	config.vm.provision "shell", inline: "sudo reboot"
end
