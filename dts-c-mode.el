;; cc-mode style
(c-add-style "dts-style"
             '((c-basic-offset . 4)     ; Guessed value
               (c-offsets-alist
                (block-close . 0)       ; Guessed value
                (defun-block-intro . +) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (defun-open . 0)        ; Guessed value
                (statement . 0)         ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (topmost-intro . 0)         ; Guessed value
                (case-label . 4) ;
;                (c . doerthous-c-lineup-C-comments)
                )
               ))


;;(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'ggtags-mode)
;;(add-hook 'c-mode-hook 'yas-minor-mode)

(add-hook 'c-mode-hook 'doerthous-c-mode-hook)
(defun doerthous-c-mode-hook()
;  (set (make-local-variable 'company-backends) '(company-dabbrev company-gtags company-yasnippet))
;  (local-set-key [C-tab] 'company-gtags)
  (c-set-style "dts-style")
;  (local-set-key (kbd "C-c C-r") 'doerthous-c-run)
  )
