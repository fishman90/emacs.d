;;-*- lexical-binding: t; -*-

(show-paren-mode)

(electric-indent-mode)
(electric-layout-mode)
(electric-pair-mode)
(electric-quote-mode)

(use-package rainbow-mode :hook (lsp-mode  . rainbow-mode))

(use-package rainbow-delimiters
  :hook (lsp-mode . rainbow-delimiters-mode))
