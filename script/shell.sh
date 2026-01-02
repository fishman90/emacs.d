#! /bin/bash

sudo snap refresh
sudo snap install --classic bash-language-server
sudo snap install --edge shellcheck

go install mvdan.cc/sh/v3/cmd/shfmt@latest
