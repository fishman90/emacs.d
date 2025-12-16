;;-*- lexical-binding: t; -*-

(show-paren-mode)

(electric-indent-mode)
(electric-layout-mode)
(electric-pair-mode)
(electric-quote-mode)

(use-package rainbow-mode :hook (prog-mode  . rainbow-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
