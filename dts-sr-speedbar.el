(eval-after-load 'sr-speedbar
  '(progn
     (message "%s" "doerthous sr-speedbar setting...")
     (global-set-key (kbd "C-c o") 'sr-speedbar-toggle)
     (setq sr-speedbar-right-side nil)
     ;; show all files
     (custom-set-variables
      '(speedbar-show-unknown-files t)
      )
     ;; disable other window command to select sr-speedbar
     (setq sr-speedbar-skip-other-window-p t)
     ))

(require 'sr-speedbar)
