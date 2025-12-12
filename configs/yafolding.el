;;-*- lexical-binding: t; -*-

(use-package yafolding
  :bind (:map lsp-mode-map ("C-t" . yafolding-toggle-element))
  :hook (lsp-mode . yafolding-mode)
  :config (fishman-save-current-buffer-before 'yafolding-toggle-element))
