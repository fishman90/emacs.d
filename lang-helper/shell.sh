#! /bin/bash

sudo snap refresh
sudo snap install --classic bash-language-server

go install mvdan.cc/sh/v3/cmd/shfmt@latest
