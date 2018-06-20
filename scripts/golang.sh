#!/bin/bash
printf "\n\ninstalling Go 1.10.3 ...\n"
wget -q https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz

printf "\n\nupdating paths for Go ...\n"
sudo echo "export GOROOT=/usr/local/go" >> /home/vagrant/.bashrc
sudo echo "export GOPATH=\$HOME/go" >> /home/vagrant/.bashrc
sudo echo "export PATH=\${PATH}:\${GOROOT}/bin" >> /home/vagrant/.bashrc
sudo echo "export PATH=\${PATH}:\${GOPATH}/bin" >> /home/vagrant/.bashrc
source ~/.bashrc

printf "\n\ncreating Go workspace  ...\n"
sudo mkdir -p /home/vagrant/go/src /home/vagrant/go/bin /home/vagrant/go/pkg
sudo chown -R vagrant:vagrant /home/vagrant/go
sudo rm go1.10.3.linux-amd64.tar.gz

printf "\n\ncinstalling dep  ...\n"
sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

printf "\n\nfinished installing Go!\n"
