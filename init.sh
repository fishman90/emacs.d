#! /bin/bash

alias emacs="emacs -nw -l ~/.emacs.d/init.el"


# Golang
[ -f "$HOME/.g/env" ] && source "$HOME/.g/env"

export GO111MODULE=on

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin":"$PATH"

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Shell
