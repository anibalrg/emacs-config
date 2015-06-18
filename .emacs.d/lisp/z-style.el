;; C-c C-s to view current syntactic symbol
;; C-c C-o to change current syntactic symbol
;; C-c C-q to indent current region
;;
(defconst z-c-style
  '((indent-tabs-mode . nil)
    (c-comment-only-line-offset . 0)
    (c-basic-offset . 4)
    (c-offsets-alist
     (access-label . -)
     (block-close . 0)
     (brace-list-close . 0)
     (brace-list-entry . 0)
     (brace-list-intro . +)
     (case-label . +)
     (class-close . 0)
     (defun-block-intro . +)
     (defun-close . [0])
     (inclass . +)
     (inline-close . 0)
     (innamespace . 0)
     (namespace-close . 0)
     (statement . 0)
     (statement-block-intro . +)
     (statement-case-intro . +)
     (topmost-intro . 0)
     (topmost-intro-cont . 0)
     (annotation-top-cont . 0)
     (annotation-var-cont . +)
     (arglist-close . c-lineup-close-paren)
     (arglist-cont c-lineup-gcc-asm-reg 0)
     (arglist-cont-nonempty . c-lineup-arglist)
     (arglist-intro . +)
     (block-open . 0)
     (brace-entry-open . 0)
     (brace-list-open . 0)
     (c . c-lineup-C-comments)
     (catch-clause . 0)
     (class-open . 0)
     (comment-intro . c-lineup-comment)
     (composition-close . 0)
     (composition-open . 0)
     (cpp-define-intro c-lineup-cpp-define +)
     (cpp-macro . -1000)
     (cpp-macro-cont . +)
     (defun-open . 0)
     (do-while-closure . 0)
     (else-clause . 0)
     (extern-lang-close . 0)
     (extern-lang-open . 0)
     (friend . 0)
     (func-decl-cont . +)
     (incomposition . +)
     (inexpr-class . +)
     (inexpr-statement . +)
     (inextern-lang . +)
     (inher-cont . c-lineup-multi-inher)
     (inher-intro . +)
     (inlambda . c-lineup-inexpr-block)
     (inline-open . +)
     (inmodule . +)
     (knr-argdecl . 0)
     (knr-argdecl-intro . +)
     (label . 2)
     (lambda-intro-cont . +)
     (member-init-cont . c-lineup-multi-inher)
     (member-init-intro . +)
     (module-close . 0)
     (module-open . 0)
     (namespace-open . 0)
     (objc-method-args-cont . c-lineup-ObjC-method-args)
     (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
     (objc-method-intro .
                        [0])
     (statement-case-open . 0)
     (statement-cont . +)
     (stream-op . c-lineup-streamop)
     (string . -1000)
     (substatement . +)
     (substatement-label . 2)
     (substatement-open . +)
     (template-args-cont c-lineup-template-args +)))
  "Z C/C++ indent style")


(defun z-set-c-style ()
  "Set the current buffer's c-style to my own style"
  (interactive)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-add-style "z-style" z-c-style t)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map [ret] 'newline-and-indent))


(provide 'z-style)