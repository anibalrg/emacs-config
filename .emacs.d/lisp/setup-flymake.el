;; flymake and flymake-cursor

(defun flymake-create-temp-intemp (file-name suffix)
  "Return file name in temporary directory for checking FILE-NAME.
This is a replacement for `flymake-create-temp-inplace'. The
difference is that it gives a file name in
`temporary-file-directory' instead of the same directory as
FILE-NAME.

For the use of SUFFIX see that function.

Note that not making the temporary file in another directory
\(like here) will not if the file you are checking depends on
relative paths to other files \(for the type of checks flymake
makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or suffix
      (setq suffix "flymake"))
  (let* ((name (concat
                "."
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" suffix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s" file-name temp-name)
    temp-name))


(when (load "flymake" t)
  ;; JSLint syntax check.
  ;; flymake-create-temp-inplace replaced by flymake-create-temp-intemp
  ;; (defun flymake-jslint-init ()
  ;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
  ;;                      'flymake-create-temp-intemp))
  ;;          (local-file (file-relative-name
  ;;                       temp-file
  ;;                       (file-name-directory buffer-file-name))))

  ;;     (list "jslint" (list local-file))))

  (defun flymake-jshint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-intemp))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))

      (list "jshint" (list local-file))))

  ;; Google Closure compiler (add to flymake-allowed-file-name-masks)
  (defun flymake-closure-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-intemp))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/bin/closure-compiler" (list local-file))))

  (setq flymake-err-line-patterns
        (cons '("^\\(.*\\)(\\([[:digit:]]+\\)):\\(.*\\)$"
                1 2 nil 3)
              flymake-err-line-patterns))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.js\\'" flymake-jslint-init)))

(require 'flymake-cursor)
(require 'rfringe)


(provide 'setup-flymake)

