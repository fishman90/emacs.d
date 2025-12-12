;;-*- lexical-binding: t; -*-

(use-package nim-mode
  :bind (:map nim-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (save-buffer)
		 (display-message-or-buffer
		  (shell-command-to-string
		   (format "nph %s" (buffer-file-name))))
		 (revert-buffer t t t))))
  :hook (nim-mode . lsp-deferred))
