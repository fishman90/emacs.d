#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y terminator
sudo apt install -y xclip xsel
sudo apt install -y wget
sudo apt install -y git

sudo apt autoremove -y
sudo apt autoclean
