;; dired
(global-auto-revert-mode 1) ; auto refresh buffers
; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)


(provide 'setup-dired)
