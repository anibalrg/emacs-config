;;_____________________________________________________________________________
;;
;; Emacs setup
;;
;; TODO
;; - Review comments
;; - Review c++ auto completion (include c++ headers)
;; - Create github repo
;;
;; anibalrg - 2015
;;_____________________________________________________________________________
;; These lines hide toolbar and menu during boot. They should be firstly executed.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash
(setq inhibit-startup-message t)

;; Path dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settigs-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settigs-dir)
(add-to-list 'load-path site-lisp-dir)

;; Current OS
(setq is-mac (equal system-type 'darwin))
(setq is-linux (or (equal system-type 'gnu) (equal system-type 'gnu/linux)))

;; Byte compilation
;(byte-recompile-directory lisp-dir)

;; Paths to libraries and auto-install packages
(setq lisp-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path lisp-dir)

(require 'setup-packages)
(require 'setup-autoinstall)
(require 'setup-custom)
(require 'setup-backup)
(require 'setup-global)
(require 'setup-ac)
(require 'setup-yasnippet)
(require 'setup-irony)
(require 'setup-spell-checker)
(require 'setup-flymake)
(require 'setup-cc-mode)
(require 'setup-ws)
(require 'setup-guide-key)
(eval-after-load 'ido '(require 'setup-ido))
(require 'setup-visual-regexp)
(require 'setup-smex)
(require 'setup-iedit)
(require 'setup-diminish)
(require 'setup-appearance)
(require 'setup-ediff)
