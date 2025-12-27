#! /bin/bash

alias emacs="emacs -nw -l ~/.emacs.d/init.el"


# Golang
[ -f "$HOME/.g/env" ] && . "$HOME/.g/env"

export GO111MODULE=on

# Haskell
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# Python
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
