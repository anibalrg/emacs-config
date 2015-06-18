; scroll-margin: how close point can come to the top or bottom of a window
; scroll-conservatively:
; scroll-up-aggressively, scroll-down-aggressively: where on the screen to put point when scrolling upward or downward.

; from: www.emacswiki.org/emacs/SmoothScrolling:

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)

(provide 'setup-autoscroll)
