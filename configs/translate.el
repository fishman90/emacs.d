;;-*- lexical-binding: t; -*-

(use-package gt
  :after transient
  :custom ((gt-langs '(en zh))
	   (gt-default-translator
	    (gt-translator :render
 			   (gt-buffer-render)
			   :engines (gt-google-engine))))
  :config (general-define-key :keymaps 'override "C-c C-g" 'gt-translate))
