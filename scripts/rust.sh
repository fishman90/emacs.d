#! /bin/bash

rustup=$(command -v rustup || true)
if [[ "$rustup" == "" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash
  rustup component add rust-analyzer
else
  rustup update
fi

cargo install --git https://github.com/rust-lang/rust-clippy.git --branch master clippy

cargo install --git https://github.com/sharkdp/fd.git --branch master fd-find
cargo install --git https://github.com/BurntSushi/ripgrep.git --branch master ripgrep
