;;-*- lexical-binding: t; -*-

(use-package eshell-vterm
  :custom ((confirm-kill-processes nil)
	   (vterm-ignore-blink-cursor nil))
  :bind ("C-v" . vterm-toggle))

(use-package vterm-toggle
  :config (fishman-save-some-buffers-around 'vterm-toggle))
