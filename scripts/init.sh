#! /bin/bash

alias emacs="emacs -nw -l ~/.emacs.d/init.el"

# Elixir
eval "$(mise activate zsh)" 2>/dev/null || true

# Golang
[ -f "$HOME/.g/env" ] && . "$HOME/.g/env"

export GO111MODULE=on

# Nim
export PATH=~/.nimble/bin:$PATH

# Python
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Zig
export ZVM_INSTALL=~/.zvm/self
export PATH=$ZVM_INSTALL:$PATH
export PATH=~/.zvm/bin:$PATH
