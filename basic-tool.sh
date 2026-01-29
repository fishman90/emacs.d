#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y terminator
sudo apt install -y xclip xsel
sudo apt install -y wget
sudo apt install -y git

sudo apt autoremove -y
sudo apt autoclean

sudo snap refresh
sudo snap install node --classic

sudo npm install -g yaml-language-server
sudo npm install -g dockerfile-language-server-nodejs

eget hadolint/hadolint --to ~/.local/bin --upgrade-only
