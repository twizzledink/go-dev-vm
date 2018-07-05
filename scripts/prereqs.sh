#!/bin/bash
printf "\n\ninstalling prereqisite packages ...\n"
sudo echo "deb http://ftp.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -qq linux-headers-$(uname -r) build-essential dkms
sudo apt-get install -qq apt-transport-https ca-certificates curl gnupg2 software-properties-common git
sudo apt-get clean
printf "\nfinished prereqisite packages\n"