(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(package-initialize)
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa.org/packages/"))
;; company
;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (with-eval-after-load 'company
;;   (define-key company-active-map (kbd "n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
;;  (define-key company-active-map (kbd "p") (lambda () (interactive) (company-complete-common-or-cycle -1))))
;; multiple-cursors
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-S-<mouse-1>") 'mc/toggle-cursor-on-click)
;; expand-region
;; (require 'expand-region)
;; smex
;; (require 'smex)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'executen-extended-command) ;; old M-x
;; ido
;; (require 'ido)
;; (ido-mode t)
;; yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (setq yas-triggers-in-field t)
;; cc-mode
(require 'cc-mode)
;; whiltespacs
;; (require 'whitespace)
;; speedbar
;; (require 'sr-speedbar)
;; (global-set-key (kbd "C-S-s") 'sr-speedbar-toggle)
;; (setq sr-speedbar-right-side nil)
;; window-numbering
;;(require 'window-numbering)
;;(window-numbering-mode t)
;; powerline
(require 'powerline)
(powerline-default-theme)
;; tabbar
(require 'tabbar)
(tabbar-mode 1)
;; git-gutter
;;(require 'git-gutter)
;;(global-git-gutter-mode t)
;;(git-gutter:linum-setup)
;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)

(load "~/.emacs.d/dts-c-mode.el")
(load "~/.emacs.d/dts-key-binding.el")
(load "~/.emacs.d/dts-theme.el")
(load "~/.emacs.d/dts-misc.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customizations 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; cu"stom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (window-number yasnippet-snippets ## yasnippet smex expand-region company ggtags multiple-cursors spinner magit ht f dash-functional)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )