;;-*- lexical-binding: t; -*-

(use-package lsp-java
  :custom (lsp-java-server-install-dir "~/.local/eclipse.jdt.ls")
  :bind (:map java-mode-map ("M-\\" . fishman/lsp-format))
  :hook (java-mode .
		   (lambda ()
		     (setq-local indent-tabs-mode nil tab-width 4)
		     (lsp-deferred))))
