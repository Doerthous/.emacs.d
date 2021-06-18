;; window-numbering
;; use M-1, M-2, ..., M-0 to index window

(eval-after-load 'window-numbering
  '(progn
     (message "%s" "doerthous window-numbering setting...")
     (window-numbering-mode t)
     (defun window-numbering-install-mode-line (&optional position) ())
     ))

(require 'window-numbering)