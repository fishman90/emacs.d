#! /bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y xclip xsel
sudo apt install -y git
sudo apt install -y wget

sudo apt autoremove -y
sudo apt autoclean

go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

cargo install --git https://github.com/BurntSushi/ripgrep.git --branch master ripgrep
cargo install --git https://github.com/sharkdp/fd.git --branch master fd-find
