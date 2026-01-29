#! /bin/bash

sudo apt install -y clangd bear indent

if [[ -d ~/.pymake ]]; then
    (
        cd ~/.pymake
        git pull
    )
else
    git clone https://github.com/Melinysh/PyMake.git ~/.pymake
fi
