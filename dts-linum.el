;; linum
;; display line number

(eval-after-load 'linum
  '(progn
     (message "%s" "doerthous linum setting...")
     (global-linum-mode t)
     (setq linum-format "%d ")
     (set-face-attribute 'linum nil :background "#0000")
     (global-set-key (kbd "C-c l") 'linum-mode)
     ))

(require 'linum)
