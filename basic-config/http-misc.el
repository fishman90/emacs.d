;;-*- lexical-binding: t; -*-

(use-package verb
  :custom ((verb-auto-show-headers-buffer t)
	   (verb-show-timeout-warning 30))
  :bind (:map org-mode-map ("C-c C-c" . verb-export-request-on-point))
  :config ; nofmt
  (fishman/save-current-buffer-around 'verb-export-request-on-point)
  (fishman/save-current-buffer-before 'verb-send-request-on-point-display)
  (general-define-key :keymaps 'org-mode-map "C-c C-r" 'verb-send-request-on-point-display))

(use-package curl-to-elisp
  :bind (:map org-mode-map ("C-c C-v" . curl-to-elisp-verb))
  :config (fishman/save-current-buffer-around 'curl-to-elisp-verb))

(use-package grpclient
  :straight (:type git :host github :repo "Prikaz98/grpclient.el")
  :mode ("\\.grpc\\'" . grpclient-mode)
  :bind (:map grpclient-mode-map
	      ("C-c C-d" . grpclient-describe)
	      ("C-c C-r" . grpclient-send-current))
  :config (fishman/save-current-buffer-before 'grpclient-send-current))

(defun fishman/json-format ()
  (interactive)
  (let ((start
	 (if (use-region-p) (region-beginning) (point-min)))
	(end
	 (if (use-region-p) (region-end) (point-max))))
    (shell-command-on-region
     start
     end
     "jq ."
     (current-buffer)
     t
     "*jq error*"
     t)))

(use-package js
  :bind (:map js-json-mode-map ("M-\\" . fishman/json-format))
  :config (fishman/save-current-buffer-around 'fishman/json-format))
