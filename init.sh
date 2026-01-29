#! /bin/bash

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

export PATH=~/.local/bin:$PATH

alias emacs="emacs -nw -l ~/.emacs.d/init.el"

# Bash
export PATH=/snap/bin:$PATH

# C
export C_INCLUDE_PATH=$C_INCLUDE_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

alias pymake="python ~/.pymake/pymake.py"

# Golang
[ -f $HOME/.g/env ] && source $HOME/.g/env

export GO111MODULE=on
export CGO_ENABLED=0

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
