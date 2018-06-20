#!/bin/bash
printf "\n\ninstalling desktop environment ..."
sudo apt-get install -y cinnamon gnome-terminal lightdm
sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable
sudo apt-get clean

# set to 2 because my current monitor is 4K
gsettings set org.cinnamon.desktop.interface scaling-factor 2
gsettings set org.gnome.nautilus.desktop home-icon-visible true
gsettings set org.gnome.nautilus.desktop trash-icon-visible true
gsettings set org.cinnamon desktop-effects-on-dialogs false
gsettings set org.cinnamon.desktop.interface cursor-theme 'Adwaita'
gsettings set org.cinnamon.desktop.interface icon-theme 'Adwaita'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adwaita-dark'