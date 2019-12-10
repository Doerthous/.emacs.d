(require 'company)
(global-company-mode 1)
;(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
;; (with-eval-after-load 'company
;;   (define-key company-active-map (kbd "n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
;;   (define-key company-active-map (kbd "p") (lambda () (interactive) (company-complete-common-or-cycle -1))))

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "C:/Users/Doerthous/Desktop/env/mingw/include")
