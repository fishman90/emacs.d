;;-*- lexical-binding: t; -*-

(use-package magit
  :custom (magit-format-file-function 'magit-format-file-nerd-icons)
  :bind ; nofmt
  ("C-x j" . magit-log-current)
  ("C-x y" . magit-log-buffer-file)
  ("C-x s" . magit-branch-checkout)
  :hook ; nofmt
  (magit-status-mode .
		     (lambda ()
		       (display-line-numbers-mode)
		       (setq-local tab-width 4)))
  (magit-log-mode . display-line-numbers-mode)
  (magit-revision-mode . display-line-numbers-mode)
  :config ; nofmt
  (fishman/save-some-buffers-before 'magit-status)
  (fishman/save-some-buffers-before 'magit-log-current)
  (fishman/save-some-buffers-before 'magit-log-buffer-file)
  (fishman/save-some-buffers-before 'magit-branch-checkout))

(use-package magit-todos :after magit :config (magit-todos-mode))

(use-package git-modes)

(fishman/save-current-buffer-around 'indent-region)

(require 'conf-mode)

(define-key conf-unix-mode-map (kbd "C-\\") 'fishman/smart-comment)

(define-key conf-unix-mode-map
	    (kbd "M-\\")
	    (lambda ()
	      (interactive)
	      (setq-local indent-tabs-mode nil tab-width 2)
	      (let ((start
		     (if (use-region-p)
			 (region-beginning)
		       (point-min)))
		    (end
		     (if (use-region-p) (region-end) (point-max))))
		(indent-region start end))))
