#! /bin/bash

pyenv=$(command -v pyenv || true)
if [[ "$pyenv" == "" ]]; then
  curl -fsSL https://pyenv.run | bash
else
  pyenv update
fi

pyenv doctor

target_version="3.11.14"
pyenv install -s $target_version
pyenv global $target_version

pip install --user --upgrade pip
pip install --user --upgrade pyright isort black autoflake
pip install --user --upgrade pip-autoremove
