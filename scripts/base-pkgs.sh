#!/bin/bash
printf "\n\ninstalling VBoxGuestAdditions ...\n"
wget -q http://download.virtualbox.org/virtualbox/5.2.12/VBoxGuestAdditions_5.2.12.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.2.12.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
sudo umount /media/VBoxGuestAdditions
rm VBoxGuestAdditions_5.2.12.iso
sudo rmdir /media/VBoxGuestAdditions
printf "\nfinished VBoxGuestAdditions ...\n"

printf "\n\ninstalling prereqisite packages ...\n"
sudo echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -qq linux-headers-$(uname -r) build-essential dkms
sudo apt-get install -qq apt-transport-https ca-certificates curl gnupg2 software-properties-common git aptitude tasksel
sudo apt-get clean
printf "\nfinished prereqisite packages\n"