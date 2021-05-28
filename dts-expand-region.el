;; expand-region
;; use C-= to expand region

(eval-after-load 'expand-region
  '(progn
     (message "%s" "doerthous expand-region setting...")
     (global-set-key (kbd "C-c =") 'er/expand-region)))

(require 'expand-region)
