;;-*- lexical-binding: t; -*-

(use-package paredit :hook (emacs-lisp-mode . paredit-mode))

(use-package emr
  :bind (:map emacs-lisp-mode-map ("C-c C-r" . emr-show-refactor-menu)))

(use-package macrostep
  :bind (:map emacs-lisp-mode-map
	      ("M-o" . macrostep-expand)
	      ("M-i" . macrostep-collapse)))

(use-package elfmt
  :straight (:type git :host github :repo "riscy/elfmt")
  :bind (:map emacs-lisp-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (elfmt-buffer)
		 (message "Buffer is formatted"))))
  :config (fishman/save-current-buffer-around 'elfmt-buffer))

(use-package aggressive-indent
  :hook (emacs-lisp-mode . aggressive-indent-mode))

(use-package helpful
  :bind (:map emacs-lisp-mode-map
	      ("C-h f" . helpful-callable)
	      ("C-h k" . helpful-key)
	      ("C-h p" . helpful-at-point)
	      ("C-h v" . helpful-variable)
	      ("C-h x" . helpful-command)))
