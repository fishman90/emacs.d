#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y git
sudo apt install -y wget
sudo apt install -y xclip xsel

sudo apt autoremove -y
sudo apt autoclean

cargo install --git https://github.com/sharkdp/fd.git --branch master fd-find
cargo install --git https://github.com/BurntSushi/ripgrep.git --branch master ripgrep

go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

pip install --user --upgrade tombi

sudo snap refresh
