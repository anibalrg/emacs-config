; OS X configuration

;; change command to meta, 
(setq ns-alternate-modifier 'super) ; option
(setq ns-command-modifier 'meta)    ; command
(setq ns-function-modifier 'hyper)  ; function

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Fix missing keys on osx
(global-set-key (kbd "M-1") "|")
(global-set-key (kbd "M-2") "@")
(global-set-key (kbd "M-3") "#")
(global-set-key (kbd "M-º") "\\")
(global-set-key (kbd "M-ç") "}")
(global-set-key (kbd "M-+") "]")
(global-set-key (kbd "M-ñ") "~")

;; Monaco as default font
(when window-system
  (setq zinc-default-font
	"-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (setq zinc-presentation-font
	"-apple-Monaco-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")

  (set-face-attribute 'default nil :font zinc-default-font))

;; Move to trash
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")


;; Open files
(defun mac-open-current-file ()
  (interactive)
  (shell-command (concat "open" (buffer-file-name))))

(global-set-key (kbd "C-c C-S-o") 'mac-open-current-file)

(provide 'setup-osx)
