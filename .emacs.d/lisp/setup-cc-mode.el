;;; C/C++

;; Global variables
(setq default-fill-column 120)
(setq next-line-add-newlines t) ; Insert newline to avoid 'end of buffer' errors
(setq-default indent-tabs-mode nil) ; Spaces instead of tabs
(setq compilation-window-height 10)


;; Identation
(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior

(require 'cc-mode)
(require 'z-style)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))
            (z-set-c-style)
            (auto-fill-mode)
            (fill-column 120)
            (c-toggle-auto-hungry-state 1)))

;; auto-complete-c-headers
(require 'setup-ac)
(require 'auto-complete-c-headers)

;; Read a list from a file with an element by line.
(defun read-list-from-file (file-name)
  "Creates a list with an element for each line of file-name"
  (split-string
   (with-temp-buffer
     (insert-file-contents file-name)
     (buffer-substring-no-properties
      (point-min)
      (point-max))) "\n" t))

; (read-list-from-file "/home/anibal/.emacs.d/achead-includes")

;(setq achead:get-include-directories-function 'read-list-from-file)
; Execute scripts/achead-include-directories instead of read a achead-includes
(defun achead-includes-dirs ()
  (delete-dups
   (append achead:include-directories
           (split-string
            (shell-command-to-string
             (concat user-emacs-directory "scripts/achead-include-directories"))
            "\n" t))))
; It seems doesn't work:
;(setq achead:get-include-directories-function 'achead-includes-dirs)
(setq achead:include-directories (achead-includes-dirs))


(add-hook 'c-mode-common-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)))


;; Current function/method in mode-line
(setq which-func-modes t)
(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c++-mode-map (kbd "C-m") 'reindent-then-newline-and-indent)
            (define-key c++-mode-map (kbd "C-c f") 'ff-find-other-file)
            (define-key c++-mode-map (kbd "C-c p") 'build-project)
            (setq c++-empty-arglist-indent 4)
            (setq c++-delete-function 'backward-delete-char)
            (setq c++-tab-always-indent t)))

;(c-set-offset 'innamespace 4) ; C++ namespace level of indentation.

(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map [(control c) ?f] 'ff-find-other-file)

            (setq c-auto-hungry-initial-state 'none)
            (setq c-delete-function 'backward-delete-char)
            (setq c-tab-always-indent t)
            ;; BSD-ish indentation style.
            ;; Useful?
            (setq c-indent-level 4)
            (setq c-continued-statement-offset 4)
            (setq c-brace-offset 0)
            (setq c-argdecl-indent 0)
            (setq c-label-offset 0)))

;; Default mode depending on file extension
;(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
;(autoload 'c-mode    "cc-mode" "C Editing Mode"   t)

;; Find other file
(defvar my-cpp-other-file-alist
  '(("\\.cpp\\'" (".h" ".hh" ".hpp" ".ipp"))
    ("\\.hpp\\'" (".cpp" ".ipp"))
    ("\\.ipp\\'" (".hpp" ".cpp"))
    ("\\.cxx\\'" (".hxx" ".ixx"))
    ("\\.ixx\\'" (".cxx" ".hxx"))
    ("\\.hxx\\'" (".ixx" ".cxx"))
    ("\\.cc\\'" (".hh" ".h"))
    ("\\.hh\\'" (".cc"))
    ("\\.c\\'" (".h"))
    ("\\.h\\'" (".c" ".cc" ".cpp"))
    ))

(setq-default ff-other-file-alist 'my-cpp-other-file-alist)

;; Flymake adn google-c-style
(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "cpplint"))
  (flymake-google-cpplint-load))

(add-hook 'c-mode-common-hook 'my:flymake-google-init)

;; member-functions
(require 'member-functions)
(setq mfc--source-file-extensions "cpp")

;; (require 'doxygen)
;; (define-key c-mode-map "\C-cd" 'doxygen-insert-comment)
;; (define-key c-mode-map "\C-cm" 'doxygen-insert-function-comment)
;; (define-key c-mode-map [(meta :)] 'doxygen-insert-compound-comment)
;; (define-key c++-mode-map "\C-cd" 'doxygen-insert-comment)
;; (define-key c++-mode-map "\C-cm" 'doxygen-insert-function-comment)
;; (define-key c++-mode-map [(meta :)] 'doxygen-insert-compound-comment)


;(eval-when-compile (require 'cl))
;(require 'auto-compile)

(provide 'setup-cc-mode)
