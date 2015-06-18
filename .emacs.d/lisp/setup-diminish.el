;; Diminish modeline
(require 'diminish)

(defmacro rename-modeline (package-name mode new-name)
  ""
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(diminish 'abbrev-mode)

(eval-after-load "irony" '(diminish 'irony-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "hs" '(diminish 'hs-minor-mode "HS"))
(eval-after-load "yas-minor-mode" '(diminish 'yas-minor-mode "Y"))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))

(provide 'setup-diminish)
