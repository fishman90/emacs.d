;;-*- lexical-binding: t; -*-

(use-package grpclient
  :straight (:type git :host github :repo "Prikaz98/grpclient.el")
  :bind (:map grpclient-mode-map ("C-c C-r" . grpclient-send-current))
  :config (fishman-save-current-buffer-before 'grpclient-send-current))
