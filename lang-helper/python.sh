#! /bin/bash

pyenv=$(command -v pyenv || true)
if [[ $pyenv == "" ]]; then
    curl -fsSL https://pyenv.run | bash
else
    pyenv update
fi

pyenv doctor

latest_version=$(pyenv install --list | grep -oP '^\s+\d\.\d{1,2}\.\d{1,2}$' | tail -n 1)
pyenv install -s $latest_version
pyenv global $latest_version

pip install --user --upgrade pip pip-autoremove
pip install --user --upgrade pyright isort black autoflake
