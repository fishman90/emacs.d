#! /bin/bash

rustup=$(command -v rustup || true)
if [[ "$rustup" == "" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  
  rustup component add rust-analyzer
  cargo install --git https://github.com/rust-lang/rust-clippy.git --branch master clippy
  
  cargo install --git https://github.com/sharkdp/fd.git --branch master fd-find
  cargo install --git https://github.com/BurntSushi/ripgrep.git --branch master ripgrep

  cargo install --git https://github.com/nabijaczleweli/cargo-update.git --branch master cargo-update
else
  rustup update
  cargo install-update -a
fi

curl -fsSL https://tombi-toml.github.io/tombi/install.sh | sh
