;;-*- lexical-binding: t; -*-

(use-package general)

(general-define-key :keymaps 'override "M-a"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (beginning-of-line-text)))

(general-define-key :keymaps 'override "M-e"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (goto-char
		       (+
			(line-beginning-position)
			(length
			 (string-trim-right
			  (buffer-substring-no-properties
			   (line-beginning-position)
			   (line-end-position))))))))

(general-define-key :keymaps 'override "C-a"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (move-beginning-of-line 1)))

(general-define-key :keymaps 'override "C-e"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (move-end-of-line 1)))

(general-define-key :keymaps 'override "M-g"
		    (lambda (line)
		      (interactive "nGoto line: ")
		      (xref-push-marker-stack)
		      (goto-char (point-min))
		      (forward-line (- line 1))))

(general-define-key :keymaps 'override "M-<"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (goto-char (point-min))))

(general-define-key :keymaps 'override "M->"
		    (lambda ()
		      (interactive)
		      (xref-push-marker-stack)
		      (goto-char (point-max))))

(general-define-key :keymaps 'override "S-<up>" 'windmove-up)

(general-define-key :keymaps 'override "S-<down>" 'windmove-down)

(general-define-key :keymaps 'override "S-<left>" 'windmove-left)

(general-define-key :keymaps 'override "S-<right>" 'windmove-right)
