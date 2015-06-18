; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(global-auto-complete-mode t)

(add-to-list
 'load-path
 (expand-file-name (concat user-emacs-directory "auto-complete")))

;(setq ac-dir (expand-file-name "ac-dict" user-emacs-directory))
;(add-to-list 'ac-dictionary-directories ac-dir)

;(require 'init-auto-complete)

;; from: https://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/
;;; set the trigger key so that it can work together with yasnnipet
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(provide 'setup-ac)
