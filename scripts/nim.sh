#! /bin/bash

choosenim=$(command -v choosenim || true)
if [[ "$choosenim" == "" ]]; then
  curl https://nim-lang.org/choosenim/init.sh -sSf | sh
else
  choosenim update stable
fi

nimble install nimlangserver --noLockfile
nimble install nph
