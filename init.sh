#! /bin/bash

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

export PATH=~/.local/bin:$PATH

alias emacs="emacs -nw -l ~/.emacs.d/init.el"

# Bash
export PATH=/snap/bin:$PATH

# Golang
[ -f $HOME/.g/env ] && source $HOME/.g/env

export GO111MODULE=on
export CGO_ENABLED=0

# Java

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# Zig
export ZVM_INSTALL=$HOME/.zvm/self
export PATH=$HOME/.zvm/bin:$PATH
export PATH=$ZVM_INSTALL:$PATH
