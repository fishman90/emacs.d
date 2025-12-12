#! /bin/bash

mise=$(command -v mise || true)
if [[ "$mise" == "" ]]; then
  curl https://mise.run | sh
else
  mise self-update
fi

mise doctor

mise use -g erlang@latest
mise use -g elixir@latest
mise use -g elixir-ls@latest
