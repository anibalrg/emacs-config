(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)

(provide 'setup-slime)
