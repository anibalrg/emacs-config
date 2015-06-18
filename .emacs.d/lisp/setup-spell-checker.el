;; Setup spell checker
;; From: emacswiki.org/emacs/InteractiveSpell

(require 'rw-language-and-country-codes)
(require 'rw-ispell)

(setq ispell-dictionary "en_US")

(when is-mac
  (setq ispell-program-name "/usr/local/bin/aspell"))

(when is-linux
  (require 'rw-hunspell)
  (setq rw-hunspell-default-dictionary "en_US"
        rw-hunspell-dicpath-list (quote ("/usr/share/hunspell"))
        rw-hunspell-make-dictionary-menu t
        rw-hunspell-use-rw-ispell t))

(provide 'setup-spell-checker)

