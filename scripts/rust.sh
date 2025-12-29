#! /bin/bash

rustup=$(command -v rustup || true)
if [[ "$rustup" == "" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  rustup component add rust-analyzer
  rustup component add clippy

  rustup toolchain install nightly
  rustup component add miri --toolchain nightly
  cargo +nightly miri setup
else
  rustup update
fi

cargo install --git https://github.com/BurntSushi/ripgrep.git --branch master ripgrep
cargo install --git https://github.com/sharkdp/fd.git --branch master fd-find
