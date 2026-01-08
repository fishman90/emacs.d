#! /bin/bash

pyenv=$(command -v pyenv || true)
if [[ "$pyenv" == "" ]]; then
  curl -fsSL https://pyenv.run | bash
else
  pyenv update
fi

pyenv doctor

latest_version="3.14.2"
pyenv install -s $latest_version
pyenv global $latest_version

pip install --user --upgrade pip pip-autoremove
pip install --user --upgrade pyright isort black autoflake
