;; Setup ido mode
(require 'ido)
(ido-mode t)

;; Enable fuzzy matching
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-everywhere t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(setq ido-file-extensions-order '(".org"
                                  ".h"
                                  ".cpp"
                                  ".emacs"
                                  ".el"
                                  ".js"
                                  ".py"))

(setq ido-ignore-directories ".emacs_backups")

(when is-mac '(add-to-list 'ido-ignore-files "\\.DS_Store"))

;; flx-ido
; Better flex matching between words
(require 'flx-ido)
(flx-ido-mode 1)
; Disable ido faces to see flx highlights
(setq ido-use-faces nil)
(require 'ido-vertical-mode)
(ido-vertical-mode)
(setq ido-vertical-show-count t)

;; ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix discrepancies between newer and older versions regarding the case.
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)


(provide 'setup-ido)
