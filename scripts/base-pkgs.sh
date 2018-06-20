#!/bin/bash

printf "\n\ninstalling prereqisite packages ...\n"
sudo echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -qq linux-headers-$(uname -r) build-essential dkms
sudo apt-get install -qq apt-transport-https ca-certificates gnupg2 software-properties-common git aptitude tasksel
sudo apt-get clean

printf "\n\ninstalling VBoxGuestAdditions ...\n"
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
sudo umount /media/VBoxGuestAdditions
rm VBoxGuestAdditions.iso
sudo rmdir /media/VBoxGuestAdditions
