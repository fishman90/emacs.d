;;-*- lexical-binding: t; -*-

(menu-bar-mode -1)

(global-hl-line-mode)
(global-display-line-numbers-mode)
(column-number-mode)

(recentf-mode)
(customize-set-value 'recentf-max-saved-items 1000)
(customize-set-value 'recentf-auto-cleanup 'never)

(save-place-mode)
(size-indication-mode)

(prefer-coding-system 'utf-8)
(global-auto-revert-mode)
(customize-set-value 'enable-local-variables :safe)
(customize-set-value 'large-file-warning-threshold (* 100 1024 1024))

(customize-set-value 'auto-save-default nil)
(customize-set-value 'make-backup-files nil)
(customize-set-value 'create-lockfiles nil)

(show-paren-mode)

(electric-indent-mode)
(electric-layout-mode)
(electric-pair-mode)
(electric-quote-mode)

(indent-tabs-mode -1)
(setq tab-width 4)

(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)

(require 'ansi-color)
(customize-set-value 'compilation-scroll-output t)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(defun fishman/save-current-buffer ()
  (interactive)
  (let ((inhibit-message t))
    (when buffer-file-name (save-buffer))))

(defmacro fishman/save-current-buffer-before (fun)
  `(advice-add ,fun :before
	       (lambda (&rest _) (fishman/save-current-buffer))))

(defmacro fishman/save-current-buffer-around (fun)
  `(advice-add ,fun :around
	       (lambda (orig-fun &rest args)
                 (fishman/save-current-buffer)
                 (apply orig-fun args)
                 (fishman/save-current-buffer))))

(defun fishman/save-some-buffers ()
  (interactive)
  (let ((inhibit-message t)) (save-some-buffers t)))

(defmacro fishman/save-some-buffers-before (fun)
  `(advice-add ,fun :before
	       (lambda (&rest _) (fishman/save-some-buffers))))

(defmacro fishman/save-some-buffers-around (fun)
  `(advice-add ,fun :around
	       (lambda (orig-fun &rest args)
                 (fishman/save-some-buffers)
                 (apply orig-fun args)
                 (fishman/save-some-buffers))))

(load-file (expand-file-name "bootstrap.el" user-emacs-directory))

(dolist (config-dir '("basic-config" "lang-config"))
  (mapc
   (lambda (config-file) (load-file config-file))
   (directory-files
    (expand-file-name config-dir user-emacs-directory)
    :match "\\.el\\'")))

(customize-set-value 'custom-file
		     (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load-file custom-file))

(which-key-mode)
