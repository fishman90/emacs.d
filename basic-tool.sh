#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y git
sudo apt install -y wget
sudo apt install -y xclip xsel

sudo apt autoremove -y
sudo apt autoclean
