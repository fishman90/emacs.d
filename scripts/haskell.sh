#! /bin/bash

ghcup=$(command -v ghcup || true)
if [[ "$ghcup" == "" ]]; then
  curl https://get-ghcup.haskell.org | bash
else
  ghcup upgrade
fi

ghcup tui
