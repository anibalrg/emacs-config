;; emacswiki packages
;; from: www.emacswiki.org/emacs/AutoInstall
;; Deprecated: better is el-get-install!
(require 'auto-install)

(setq auto-install-directory
      (expand-file-name "auto-install" user-emacs-directory))

;(auto-install-update-emacswiki-package-name t)
; BUG?
; Contacting host: www.emacswiki.org:80 [2 times]
; Network unreachable!

(provide 'setup-autoinstall)
