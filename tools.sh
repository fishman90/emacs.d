#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y xclip xsel
sudo apt install -y git

sudo apt autoremove -y
sudo apt autoclean

sudo snap refresh

sudo snap install --classic bash-language-server
sudo snap install --edge shellcheck
sudo snap install shfmt

sudo snap install --edge grpcurl
