;; from: http://mattbriggs.net/blog/2012/03/18/awesome-emacs-plugins-ctags/
;; from: http://www.emacswiki.org/emacs/EtagsSelect
;; from: http://www.emacswiki.org/emacs/BuildTags

(setq tags-case-fold-search nil) ; Case sensitive to case insensitive search change to t

; Check if the tags file is there and read it, if not, build it, then run
; the plugin function
;; (defun my-find-tag ()
;;   (interactive)
;;   (if (file-exists-p (concat (eproject-root) "TAGS"))
;;       (visit-project-tags)
;;     (build-ctags))
;;   (etags-select-find-tag-at-point))
; my-find-tag replace usual etags-select-find-tag key bind
;(global-set-key (kbd "M-.") 'my-find-tag)


; emacswiki:
(defun create-tags-js (dir-name)
  "Create a tags file."
  (interactive "DDirectory:")
  (shell-command
   (format "ctags -e -R --extra=+fq --exclude=public -f TAGS" (directory-file-name dir-name))))

(require 'etags-select)


(global-set-key (kbd "M-?") 'etags-select-find-tag-at-point)

(provide 'setup-ctags)
