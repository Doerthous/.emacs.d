;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs feature configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(global-auto-revert-mode 1) ;; enable auto load when file changed outside the emacs
(setq make-backup-files nil) ;; disable backup file
;;(setq auto-save-default nil) ;; disable auto save
(electric-pair-mode 1) ;; auto complete braces
(setq require-final-newline nil) ;; disable auto insert newline at the end of file
(setq inhibit-splash-screen t) ;; disable welcome window will open emacs
(set-scroll-bar-mode nil) ;; disable scroll bar
(setq-default cursor-type 'bar) ;; change cursor from block to line
(global-hl-line-mode 1) ;; highlight
(tool-bar-mode 0) ;; disable toolbar
(menu-bar-mode 0) ;; disable menu bar
(show-paren-mode t) ;; highlight braces
;;(add-hook 'window-configuration-change-hook (lambda () (ruler-mode 1))) ;; display a ruler for column
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; full screen
(set-default-font "Microsoft YaHei Mono-12") ;; font
(defalias 'yes-or-no-p 'y-or-n-p) ;; yes-or-no -> y-or-n
(setq default-buffer-file-coding-system 'utf-8) ;; default coding system for new file
(prefer-coding-system 'utf-8)

(setq linum-format "%d ")
