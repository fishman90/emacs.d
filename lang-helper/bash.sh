#! /bin/bash

sudo snap refresh
sudo snap install --classic bash-language-server

go install -v mvdan.cc/sh/v3/cmd/shfmt@latest
