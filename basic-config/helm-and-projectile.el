;;-*- lexical-binding: t; -*-

(use-package helm
  :custom (helm-follow-mode-persistent t)
  :bind ; nofmt
  ("C-x b" . helm-buffers-list)
  ("C-x f" . helm-recentf)
  ("M-x" . helm-M-x)
  :config ; nofmt
  (helm-adaptive-mode)
  (helm-autoresize-mode)
  (helm-ff-icon-mode)
  (require 'helm-buffers)
  (set-face-background 'helm-buffer-directory nil)
  (set-face-foreground 'helm-buffer-directory "orange")
  (fishman/save-some-buffers-before 'helm-recentf)
  (fishman/save-some-buffers-before 'helm-buffer-list)
  (fishman/save-some-buffers-before 'helm-M-x))

(use-package helm-swoop
  :custom (helm-swoop-use-line-number-face t)
  :bind ("C-s" .
	 (lambda ()
	   (interactive)
	   (if (string-equal major-mode "dired-mode")
	       (let ((helm-swoop-pre-input-function (lambda ())))
		 (helm-swoop))
	     (helm-swoop))))
  :config (fishman/save-current-buffer-before 'helm-swoop))

(use-package helm-rg
  :bind ("C-b" . helm-rg)
  :config (fishman/save-some-buffers-before 'helm-rg))

(use-package helm-xref
  :config (setq xref-show-xrefs-function 'helm-xref-show-xrefs-27
		xref-show-definitions-function 'helm-xref-show-defs-27))

(use-package projectile
  :custom ((projectile-auto-discover t)
	   (projectile-indexing-method 'alien)
	   (projectile-buffers-filter-function 'projectile-buffers-with-file)))

(use-package helm-projectile
  :after projectile
  :custom ((helm-projectile-ignore-strategy 'search-tool)
	   (helm-projectile-fuzzy-match nil))
  :bind	; nofmt
  ("C-f" . helm-projectile-find-file)
  ("C-p" . helm-projectile-rg)
  ("C-r" . helm-projectile-recentf)
  ("C-x l" . helm-projectile-switch-to-buffer)
  :config ; nofmt
  (fishman/save-some-buffers-before 'helm-projectile-find-file)
  (fishman/save-some-buffers-before 'helm-projectile-rg)
  (fishman/save-some-buffers-before 'helm-projectile-recentf)
  (fishman/save-some-buffers-before 'helm-projectile-switch-to-buffer))

(use-package helm-lsp
  :after lsp-mode
  :bind (:map lsp-mode-map
	      ("C-c C-a" . helm-lsp-code-actions)
	      ("C-c C-d" . helm-lsp-diagnostics)
	      ("C-c C-s" . helm-lsp-workspace-symbol))
  :config ; nofmt
  (fishman/save-some-buffers-before 'helm-lsp-code-actions)
  (fishman/save-some-buffers-before 'helm-lsp-diagnostics)
  (fishman/save-some-buffers-before 'helm-lsp-workspace-symbol))
