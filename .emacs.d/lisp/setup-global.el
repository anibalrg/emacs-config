;;; Emacs global variables, key definitions and behaviours
;; Save file position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Activates electric-pair-mode
(electric-pair-mode 1)

;; Global variables
(column-number-mode 1)                  ; Column number is shown.
(setq tab-width 4)

;; Global key definitions

;; goto-line-with-feedback
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(global-set-key (kbd "C-.") 'goto-line)
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-,") 'tags-search)

(global-set-key (kbd "C-x c") 'kill-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-<up>") 'beginning-of-defun)
(global-set-key (kbd "M-<down>") 'end-of-defun)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c d") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c <space>") 'next-error)

(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c h") 'hi-lock-face-buffer)
(global-set-key (kbd "C-c u") 'hi-lock-unface-buffer)

;; Shrink
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x <down>") 'shrink-window)
(global-set-key (kbd "C-x <up>") 'enlarge-window)

;; zoom
(global-set-key [(control +)] 'text-scale-increase)
(global-set-key [(control -)] 'text-scale-decrease)

;; Copy rectangle (doesn't work)
; (define-key global-map [(control x) r  w] 'save-rectangle)

;; Last defined macro
;; NOTE: global-set-key is defined as (define-key (current-global-map) key command)
(define-key global-map (kbd "C-p") 'call-last-kbd-macro)

;; Open a new line above or below the curent one
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<S-C-return>") 'open-line-above)

;; Rename the current buffer
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exits!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)


;; Delete current buffer
(defun delete-current-buffer-file ()
  "Removes files connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-d") 'delete-current-buffer-file)

;; Load OS X configuration
(when is-mac
  (require 'setup-osx))

;; GS70's SteelSeries keyboard some issues
(when (string= system-name "zenit")
  ;; Attempt to insert [ç], just in case...
  (global-set-key (kbd "S-M-ç") (lambda () (interactive) (insert "ç")))
  ;; [ç] replaced by enter, to get a standard sized enter.
  (global-set-key (kbd "ç") (kbd "<return>"))
  ;; [insert] is beside [->]
  (global-set-key (kbd "<insert>") nil)
  (global-set-key (kbd "M-<insert>") 'overwrite-mode))


(provide 'setup-global)
