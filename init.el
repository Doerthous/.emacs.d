(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "https://mirrors.163.com/elpa/melpa/"))
;; (add-to-list 'package-archives '("melpa-stable" . "https://mirrors.163.com/elpa/melpa-stable/"))
;; (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/"))
(package-initialize)





;; multiple-cursors
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-S-<mouse-1>") 'mc/toggle-cursor-on-click)



;; ido
;; (require 'ido)
;; (ido-mode t)
;; yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (setq yas-triggers-in-field t)

;; cc-mode
;(require 'cc-mode)




;; tabbar
;;(require 'tabbar)
;;(tabbar-mode 1)
;; git-gutter
;;(require 'git-gutter)
;;(global-git-gutter-mode t)
;;(git-gutter:linum-setup)
;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)




;;(load "~/.emacs.d/dts-c-mode.el")
(load "~/.emacs.d/dts-key-binding.el")
(load "~/.emacs.d/dts-theme.el")
(load "~/.emacs.d/dts-org-mode.el")
(load "~/.emacs.d/dts-sr-speedbar.el")
(load "~/.emacs.d/dts-company.el")
(load "~/.emacs.d/dts-transpose-frame.el")
(load "~/.emacs.d/dts-powerline.el")
(load "~/.emacs.d/dts-window-numbering.el")
(load "~/.emacs.d/dts-linum.el")
(load "~/.emacs.d/dts-smex.el")
(load "~/.emacs.d/dts-whitespace.el")
(load "~/.emacs.d/dts-expand-region.el")
(load "~/.emacs.d/dts-misc.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customizations 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(org-agenda-files
   '("c:/Users/Doerthous/Desktop/note/高性能平台方案研发.org" "c:/Users/Doerthous/Desktop/note/2021-issue-tracking.org" "c:/Users/Doerthous/Desktop/note/2021.org"))
 '(org-log-into-drawer t)
 '(org-log-note-headings
   '((done . "CLOSING NOTE %t")
     (state . "State %-12s from %-12S %T")
     (note . "Note taken on %T")
     (reschedule . "Rescheduled from %S on %t")
     (delschedule . "Not scheduled, was %S on %t")
     (redeadline . "New deadline from %S on %t")
     (deldeadline . "Removed deadline, was %S on %t")
     (refile . "Refiled on %t")
     (clock-out . "")))
 '(package-selected-packages
   '(htmlize valign ztree window-number yasnippet-snippets ## yasnippet smex expand-region company ggtags multiple-cursors spinner magit ht f dash-functional))
 '(powerline-default-separator 'utf-8)
 '(powerline-utf-8-separator-left 9654)
 '(powerline-utf-8-separator-right 9664)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil)
 '(speedbar-use-imenu-flag nil)
 '(tab-width 4)
 '(window-numbering-mode-line nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "#0000" :inherit (shadow default)))))
 '(line-number-current-line ((t (:foreground "green yellow" :background "#232526" :inherit line-number))))
 '(powerline-inactive0 ((t (:foreground "#0000" :background "#0000"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :foreground "#0000" :background "#0000"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :foreground "#0000" :background "#0000")))))
