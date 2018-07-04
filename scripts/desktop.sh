#!/bin/bash
printf "\n\ninstalling desktop environment ..."
sudo apt-get install -y cinnamon gnome-terminal lightdm --no-install-recommends
sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable
sudo apt-get clean