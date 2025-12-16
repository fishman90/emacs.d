;;-*- lexical-binding: t; -*-

(use-package helm
  :custom (helm-follow-mode-persistent t)
  :bind ; nofmt
  ("C-x f" . helm-recentf)
  ("C-x l" . helm-buffers-list)
  ("M-x" . helm-M-x)
  :config ; nofmt
  (helm-adaptive-mode)
  (helm-autoresize-mode)
  (helm-ff-icon-mode)
  (require 'helm-buffers)
  (set-face-background 'helm-buffer-directory nil)
  (set-face-foreground 'helm-buffer-directory "orange")
  (fishman-save-some-buffers-before 'helm-recentf)
  (fishman-save-some-buffers-before 'helm-buffer-list)
  (fishman-save-some-buffers-before 'helm-M-x))

(use-package helm-swoop
  :bind ("C-s" . helm-swoop)
  :config (fishman-save-current-buffer-before 'helm-swoop))

(use-package helm-rg
  :bind ("C-b" . helm-rg)
  :config (fishman-save-some-buffers-before 'helm-rg))

(use-package projectile
  :custom ((projectile-auto-discover t)
	   (projectile-indexing-method 'hybrid)))

(use-package helm-projectile
  :after projectile
  :init (recentf-mode)
  :custom ((helm-projectile-ignore-strategy 'search-tool)
	   (helm-projectile-fuzzy-match nil))
  :bind	; nofmt
  ("C-f" . helm-projectile-find-file)
  ("C-p" . helm-projectile-rg)
  ("C-r" . helm-projectile-recentf)
  ("C-x b" . helm-projectile-switch-to-buffer)
  :config ; nofmt
  (fishman-save-some-buffers-before 'helm-projectile-find-file)
  (fishman-save-some-buffers-before 'helm-projectile-rg)
  (fishman-save-some-buffers-before 'helm-projectile-recentf)
  (fishman-save-some-buffers-before 'helm-projectile-switch-to-buffer))

(use-package helm-xref
  :config (setq xref-show-xrefs-function 'helm-xref-show-xrefs-27
		xref-show-definitions-function 'helm-xref-show-defs-27))
