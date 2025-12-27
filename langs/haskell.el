;;-*- lexical-binding: t; -*-

(use-package haskell-mode
  :bind (:map haskell-mode-map ("M-\\" . fishman/lsp-format))
  :hook (haskell-mode . lsp-deferred))

(use-package lsp-haskell)
