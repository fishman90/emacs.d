;;-*- lexical-binding: t; -*-

(use-package verb
  :custom ((verb-auto-kill-response-buffers t)
	   (verb-auto-show-headers-buffer t)
	   (verb-show-timeout-warning 30))
  :config ; nofmt
  (general-define-key :keymaps 'org-mode-map "C-\\" 'fishman/smart-comment)
  (general-define-key :keymaps 'org-mode-map "C-c C-c" 'verb-export-request-on-point)
  (fishman/save-current-buffer-around 'verb-export-request-on-point)
  (general-define-key :keymaps 'org-mode-map "C-c C-r" 'verb-send-request-on-point-display)
  (fishman/save-current-buffer-before 'verb-send-request-on-point-display))

(use-package curl-to-elisp
  :bind (:map org-mode-map ("C-c C-v" . curl-to-elisp-verb))
  :config (fishman/save-current-buffer-around 'curl-to-elisp-verb))

(defun fishman/json-format ()
  (interactive)
  (let ((start
	 (if (use-region-p) (region-beginning) (point-min)))
	(end
	 (if (use-region-p) (region-end) (point-max))))
    (shell-command-on-region
     start
     end
     "jq --indent 4 ."
     (current-buffer)
     t
     "*jq error*"
     t)))

(use-package json-mode
  :bind (:map json-mode-map ("M-\\" . fishman/json-format))
  :config (fishman/save-current-buffer-around 'fishman/json-format))
