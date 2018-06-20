#!/bin/bash
printf "\n\ninstalling Go 1.10.3 ...\n"
wget -q https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz

printf "\n\nupdating paths for Go ...\n"
sudo echo 'export GOROOT=/usr/local/go' >> /home/vagrant/.bashrc
sudo echo 'export GOPATH=$HOME/go' >> /home/vagrant/.bashrc
sudo echo 'export PATH=${PATH}:${GOROOT}/bin' >> /home/vagrant/.bashrc
sudo echo 'export PATH=${PATH}:${GOPATH}/bin' >> /home/vagrant/.bashrc

# --> needed for the workspace setup
export GOROOT=/usr/local/go
export GOPATH=/home/vagrant/go
export GOBIN=$GOPATH/bin
export PATH=${PATH}:${GOROOT}/bin
export PATH=${PATH}:${GOPATH}/bin

printf "\n\ncreating Go workspace  ...\n"
sudo mkdir -p $GOPATH/src $GOPATH/bin $GOPATH/pkg
sudo chown -R vagrant:vagrant $GOPATH

printf '\n\ninstalling dep  ...\n'
sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
sudo rm go1.10.3.linux-amd64.tar.gz

# a great unit testing assert package!
go get "github.com/stretchr/testify/assert"
printf "\n\nfinished installing Go!\n"
