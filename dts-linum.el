;; linum
;; display line number

;; after emacs 26.0, emacs has provide a display-line-numbers-mode to show line
;; number.
(if (version< emacs-version "26.0")
    (progn
      (eval-after-load 'linum
        '(progn
           (message "%s" "doerthous linum setting...")
           (global-linum-mode t)
           (setq linum-format "%d ")
           (set-face-attribute 'linum nil :background "#0000")
           (global-set-key (kbd "C-c l") 'linum-mode)
           ))
      (require 'linum))
  (progn
    (global-set-key (kbd "C-c l") 'display-line-numbers-mode)
    (global-display-line-numbers-mode t)
    ))

