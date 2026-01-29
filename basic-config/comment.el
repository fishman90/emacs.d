;;-*- lexical-binding: t; -*-

(use-package smart-comment
  :bind (:map prog-mode-map ("C-\\" . fishman/smart-comment))
  :config (fishman/save-current-buffer-around 'smart-comment))

(defun fishman/smart-comment (arg)
  (interactive "*P")
  (smart-comment arg)
  (forward-line))

(require 'newcomment)
(customize-set-value 'comment-style 'extra-line)

(defun fishman/comment-fun ()
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
      (forward-line))))

(fishman/save-current-buffer-around 'comment-or-uncomment-region)
