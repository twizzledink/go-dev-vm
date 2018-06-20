#!/bin/bash

printf "\n\nenabling ssh..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo cp sshd_config /etc/ssh/sshd_config
sudo service ssh reload
sudo rm sshd_config
