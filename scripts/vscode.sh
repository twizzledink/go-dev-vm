#!/bin/bash

printf "\ninstalling Visual Studio Code...\n"
echo deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main > /etc/apt/sources.list.d/vscode.list
sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-get update
sudo apt-get install code -y
printf "\nfinished installing Visual Studio Code!\n"

printf "\n\ninstalling Atom (as an alternative)..."
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb
sudo apt-get clean