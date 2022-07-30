(defun dts/message-with-timestamp (old-func fmt-string &rest args)
  "Prepend current timestamp (with microsecond precision) to a message"
  (apply old-func
         (concat (format-time-string "[%Y-%m-%d %H:%M:%S] ")
                 fmt-string)
         args))
(advice-add 'message :around #'dts/message-with-timestamp)
(message "doerthous init.el start")
;; (advice-remove 'message #'dts/message-with-timestamp)


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

(load "~/.emacs.d/dts-conf.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(org-agenda-files '("~/org/journal.org"))
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
   '(org-alert org ghub forge org-ql tabbar dashboard org-roam-ui org-roam projectile helm imenus pyim-basedict pyim htmlize valign ztree window-number yasnippet-snippets ## yasnippet smex expand-region company ggtags multiple-cursors spinner magit ht f dash-functional))
 '(powerline-default-separator 'utf-8)
 '(powerline-utf-8-separator-left 9654)
 '(powerline-utf-8-separator-right 9664)
 '(safe-local-variable-values
   '((org-roam-db-location . "./journal-roam.db")
     (org-roam-db-location . "./rog-roam.db")
     (org-roam-directory . ".")))
 '(send-mail-function 'mailclient-send-it)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil)
 '(speedbar-use-imenu-flag nil)
 '(tab-width 4)
 '(warning-suppress-log-types '((emacs)))
 '(warning-suppress-types '((emacs)))
 '(window-numbering-mode-line nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "#0000" :inherit (shadow default)))))
 '(line-number-current-line ((t (:foreground "green yellow" :background "#232526" :inherit line-number))))
 '(org-level-4 ((t (:inherit outline-8 :extend nil))))
 '(powerline-inactive0 ((t (:foreground "#0000" :background "#0000"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :foreground "#0000" :background "#0000"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :foreground "#0000" :background "#0000")))))

(message "doerthous init.el end")
