#! /bin/bash

sudo snap install --classic bash-language-server

go install -v mvdan.cc/sh/v3/cmd/shfmt@latest

eget koalaman/shellcheck --to ~/.local/bin --upgrade-only
