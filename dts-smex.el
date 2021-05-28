;; smex

(eval-after-load 'smex
  '(progn
     (message "%s" "doerthous smex setting...")
     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     ;;(global-set-key (kbd "C-c C-c M-x") 'executen-extended-command) ;; old M-x
     ))

(require 'smex)
