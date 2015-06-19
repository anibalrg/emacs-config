(eval-after-load 'ediff
'(progn
   (set-face-foreground 'ediff-odd-diff-B  "#ffffff")
   (set-face-background 'ediff-odd-diff-B  "#292521")
   (set-face-foreground 'ediff-even-diff-B "#ffffff")
   (set-face-background 'ediff-even-diff-B "#292527")
   (set-face-foreground 'ediff-odd-diff-A  "#ffffff")
   (set-face-background 'ediff-odd-diff-A  "#292521")
   (set-face-foreground 'ediff-even-diff-A "#ffffff")
   (set-face-background 'ediff-even-diff-A "#292427")))


(provide 'setup-ediff)
