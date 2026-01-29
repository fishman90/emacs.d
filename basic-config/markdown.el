;;-*- lexical-binding: t; -*-

(use-package markdown-mode)

(use-package separedit
  :custom ((separedit-default-mode 'markdown-mode)
	   (separedit-preserve-string-indentation t)
	   (separedit-continue-fill-column t)
	   (separedit-write-file-when-execute-save t)
	   (separedit-remove-trailing-spaces-in-comment t))
  :config ; nofmt
  (general-define-key :keymaps 'prog-mode-map "M-d" 'separedit)
  (fishman/save-current-buffer-before 'separedit))
