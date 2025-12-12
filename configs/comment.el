;;-*- lexical-binding: t; -*-

(use-package smart-comment
  :bind (:map prog-mode-map ("C-\\" . fishman-smart-comment-fun))
  :config (fishman-save-current-buffer-around 'smart-comment))

(defun fishman-smart-comment-fun (arg)
  (interactive "*P")
  (smart-comment arg)
  (next-line))

(require 'newcomment)
(customize-set-value 'comment-style 'extra-line)
(fishman-save-current-buffer-around 'comment-or-uncomment-region)

(defun fishman-comment-fun ()
  (interactive)
  (if (use-region-p)
      (progn
	(setq-local comment-start "/* " comment-end " */")
	(comment-or-uncomment-region (region-beginning) (region-end)))
    (progn
      (setq-local comment-start "// " comment-end "")
      (comment-or-uncomment-region
       (line-beginning-position)
       (line-end-position))
      (next-line))))
