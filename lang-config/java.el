;;-*- lexical-binding: t; -*-

(use-package lsp-java
  :custom (lsp-java-server-install-dir
	   (f-dirname
	    (f-dirname
	     (string-trim
	      (shell-command-to-string
	       (format "find %s -name jdtls"
		       (expand-file-name ".cache" user-emacs-directory)))))))
  :bind (:map java-mode-map ("M-\\" . fishman/lsp-format))
  :hook (java-mode .
		   (lambda ()
		     (setq-local indent-tabs-mode nil tab-width 4)
		     (lsp-deferred))))
