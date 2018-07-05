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