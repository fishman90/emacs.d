#! /bin/bash

alias emacs="emacs -nw -l ~/.emacs.d/init.el"


# Golang
[ -f "$HOME/.g/env" ] && source "$HOME/.g/env"

export GO111MODULE=on

# Java
export SDKMAN_DIR="$HOME/.sdkman"
[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin":"$PATH"

eval "$(pyenv init - zsh)" 2>/dev/null || true
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
