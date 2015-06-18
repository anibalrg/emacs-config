; Global appearance
; Visual bell
(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)

;; Selected text
(set-face-background 'region "#404740")

;; Highlight search matches
(setq search-highlight t)
(setq query-replace-highlight t)

;; Cursor change
(require 'cursor-chg)
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode

;; Highlight current line
(global-hl-line-mode 1)

;; Customize background color of lighlighted line
(set-face-background 'hl-line "#243028")

;; Recent open files
(recentf-mode 1)

;; Frame fringe size
(fringe-mode '(8 . 8))
(require 'rfringe)

;; Show empty lines at the end of a buffer
(setq-default indicate-empty-lines t)

;; Highlight in yasnippet
;(set-face-background 'yas/field-highlight-face "#333399")
(set-face-foreground 'font-lock-warning-face "#ff6666")


;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
(require 'zoom-frm)

;; Mode-line enhacements:
(require 'modeline-posn)
(column-number-mode 1)
;(size-indication-mode 1)
(setq modeline-colum-limit 120)
(setq mode-line-format
      (quote
       ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification " " mode-line-misc-info " " mode-line-position
        (vc-mode vc-mode)
        "  " mode-line-modes mode-line-end-spaces)))

;; Fringe
(set-fringe-mode '(8 . 8))

;; Hide lines:
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)

;; Hideshow
(load-library "hideshow")
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;; Icons in fringe to hide/show regions
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook))
  (add-hook hook 'hideshowvis-enable))

;; Higlighted syntax for all modes
(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)
(setq font-lock-maximum-size nil)
(require 'font-lock)
(require 'jit-lock)

;; Indicate empty lines
(setq-default indicate-empty-lines t)

;; Transparent background
;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 85))
(add-to-list 'default-frame-alist '(alpha 95 85))

;; Which function
(setq-default which-function-mode t)

(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(95 85))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

;; User themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'zenit-dark)


(provide 'setup-appearance)
