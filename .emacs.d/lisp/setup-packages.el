;;; Packages repositories
(require 'package)

;; Package repos
(setq package-archives
      '(("melpa"     . "http://melpa.org/packages/")))

;; ("gnu"       . "http://elpa.gnu.org/packages/")
;; ("marmalade" . "http://marmalade-repo.org/packages/")

;; Only refresh packages lists when ethernet or wifi adapters are up
(when (or (assoc "en0" (network-interface-list))
          (assoc "wlan0" (network-interface-list)))

  (unless (and (file-exists-p "~/.emacs.d/elpa/archives/melpa"))
    (package-refresh-contents)))

;; (file-exists-p "~/.emacs.d/elpa/archives/gnu)")
;; (file-exists-p "~/.emacs.d/elpa/archives/marmalade")


;; Initialize packages repositories
(package-initialize)


; package-install wrapper
(defun packages-install (&rest packages)
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))

; Adjusting load-path after updating packages
; From http://emacswiki.org/emacs/ELPA
(defun package-update-load-path ()
  "Update the load path for newly installed packages."
  (interactive)
  (let ((package-dir (expand-file-name package-user-dir)))
    (mapc (lambda (pkg)
            (let ((stem (symbol-name (car pkg)))
                  (version "")
                  (first t)
                  path)
              (mapc (lambda (num)
                      (if first
                          (setq first nil)
                          (setq version (format "%s." version)))
                      (setq version (format "%s%s" version num)))
                    (aref (cdr pkg) 0))
              (setq path (format "%s/%s-%s" package-dir stem version))
              (add-to-list 'load-path path)))
          package-alist)))

;; el-get (https://github.com/dimitri/el-get)
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer.
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))
(unless (require 'el-get nil 'noerror)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "el-get-user/recipes"))
(el-get 'sync)

;; List of installed packages.
;; To replicate the packages in a new installation, type M-x ielm for an Emacs Lisp prompt,
;; and enter:
`(setq my-packages
       ',(mapcar #'el-get-as-symbol
                 (el-get-list-package-names-with-status "installed")))
;; To install the packages list:
;; (el-get 'sync my-packages)

;; To print the elements of the packages list
(defun print-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))



(provide 'setup-packages)
