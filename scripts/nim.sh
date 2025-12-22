#! /bin/bash

choosenim=$(command -v choosenim || true)
if [[ "$choosenim" == "" ]]; then
  curl -sSf https://nim-lang.org/choosenim/init.sh | bash
else
  choosenim update stable
fi

nimble install nimlangserver --noLockfile
nimble install nph
