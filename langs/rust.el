;;-*- lexical-binding: t; -*-

(use-package rust-mode
  :custom (lsp-rust-analyzer-cargo-target-dir t)
  :hook (rust-mode . lsp-deferred)
  :bind (:map rust-mode-map ("M-\\" . fishman-lsp-format-fun)))
