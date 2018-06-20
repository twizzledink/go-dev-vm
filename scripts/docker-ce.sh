#!/bin/bash
printf "\n\ninstalling docker-ce...\n"
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
sudo apt-get update && apt-get install -qq docker-ce docker-compose
sudo usermod -aG docker vagrant
printf "\nfinished installing docker-ce!\n\n"
