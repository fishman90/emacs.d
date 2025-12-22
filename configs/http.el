;;-*- lexical-binding: t; -*-

(use-package verb
  :custom (verb-auto-show-headers-buffer t)
  :config ; nofmt
  (fishman-save-current-buffer-before 'verb-send-request-on-point-display)
  (general-define-key :keymaps 'org-mode-map "C-c C-r" 'verb-send-request-on-point-display))

(use-package curl-to-elisp
  :config (fishman-save-current-buffer-before 'curl-to-elisp-verb))

(use-package grpclient
  :straight (:type git :host github :repo "Prikaz98/grpclient.el")
  :bind (:map grpclient-mode-map ("C-c C-r" . grpclient-send-current))
  :config (fishman-save-current-buffer-before 'grpclient-send-current))
