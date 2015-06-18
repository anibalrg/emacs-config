;; Move backup files to its own directory
; from: whattheemacsd.com
(setq backup-directory-alist
      `(("." . ".emacs_backups")))

; Backup files, even under vc
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


(provide 'setup-backup)
