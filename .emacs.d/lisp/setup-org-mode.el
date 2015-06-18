; From: http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; Agenda files
(setq org-agenda-files (list "~/org/log.org"
                             "~/org/notes.org"
                             "~/org/work.org"
                             "~/org/home.org"
                             "~/org/m10.org"))

;; org-mode colors
(setq org-todo-keyword-faces
      '(
        ("INPR" . (:foreground "yellow" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("IMPEDED" . (:foreground "red" :weight bold))
        ))

(provide 'setup-org-mode)
