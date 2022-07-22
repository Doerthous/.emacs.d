;;; dts-pkgconf.el --- This is used for configuration of other packages
;;; Commentary:
;;; Code:
;;;; c-mode
(add-hook 'c-mode-hook 'outline-minor-mode)
(defvar dts/c-outline-regexp "/[/]+")
(defun dts/c-outline-level ()
  "DTS c mode `outline-level' function."
  (- (match-end 0) (match-beginning 0)))

;;;; company-mode

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
(add-to-list 'company-c-headers-path-system "/usr/include")

;;;; expand-region

;; expand-region
;; use C-= to expand region
(eval-after-load 'expand-region
  '(progn
     (message "%s" "doerthous expand-region setting...")
     (global-set-key (kbd "C-c =") 'er/expand-region)))
(require 'expand-region)

;;;; eamcs-lisp-mode
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)

;;;; linum-mode
;; after emacs 26.0, emacs has provide a display-line-numbers-mode to show
;; line number.
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
    (global-display-line-numbers-mode t)))

;;;; mu4e

(let (
      (mu4epath
       (let ((mu4epaths (list
                         "/usr/local/share/emacs/site-lisp/mu/mu4e"
                         "/usr/local/share/emacs/site-lisp/mu4e")))
	 (require 'cl)
         (catch 'break
           (loop for i in mu4epaths
                 do (if (file-directory-p i)
                        (throw 'break i)))))))
  (if mu4epath
      (progn
        (message (format "load mu4e from %s" mu4epath))
        (add-to-list 'load-path mu4epath)
        (require 'mu4e))
    (message "mu4e not found.")))

;;;; org-mode

;;(require 'org-sidebar)

;;
(defun dts-org-clock-in-hook ()
  "Doerthous org mode hook. For insert a active timestamp when org-clock-in"
  (let* ((col (string-match "CLOCK:" (thing-at-point 'line t))))
    (newline)
    (dotimes (i col) (insert " "))
    (insert "       "))
  (org-time-stamp '(16))
  )
(add-hook 'org-clock-in-hook 'dts-org-clock-in-hook)
(defun dts-org-clock-out-hook ()
  "Doerthous org mode hook. For insert an active timestamp when org-clock-out"
  (next-line)
  (move-end-of-line 1)
  (insert "--")
  (org-time-stamp '(16))
  )
(add-hook 'org-clock-out-hook 'dts-org-clock-out-hook)

;; for chinese characters align in org-table
(add-hook 'org-mode-hook #'valign-mode)

(setq org-log-done-with-time 1)
(setq org-log-done 'time)
(require 'ox-md)
(setq org-image-actual-width (/ (display-pixel-width) 3))
(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

(org-babel-do-load-languages 'org-babel-load-languages
			     '(
			       (shell . t)
			       (ditaa . t)
                   (plantuml . t)
			       ))

(setq org-confirm-babel-evaluate nil)
(setq org-ditaa-jar-path "~/.emacs.d/java/ditaa.jar")
(setq org-plantuml-jar-path "~/.emacs.d/java/plantuml.jar")

;; css style when export as html
(setq org-html-head
      "<meta http-equiv='X-UA-Compatible' content='IE=edge'><meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'><style>html{touch-action:manipulation;-webkit-text-size-adjust:100%}body{padding:0;margin:0;background:#f2f6fa;color:#3c495a;font-weight:normal;font-size:15px;font-family:'San Francisco','Roboto','Arial',sans-serif}h2,h3,h4,h5,h6{font-family:'Trebuchet MS',Verdana,sans-serif;color:#586b82;padding:0;margin:20px 0 10px 0;font-size:1.1em}h2{margin:30px 0 10px 0;font-size:1.2em}a{color:#3fa7ba;text-decoration:none}p{margin:6px 0;text-align:justify}ul,ol{margin:0;text-align:justify}ul>li>code{color:#586b82}pre{white-space:pre-wrap}#content{width:96%;max-width:1000px;margin:2% auto 6% auto;background:white;border-radius:2px;border-right:1px solid #e2e9f0;border-bottom:2px solid #e2e9f0;padding:0 115px 150px 115px;box-sizing:border-box}#postamble{display:none}h1.title{background-color:#343C44;color:#fff;margin:0 -115px;padding:60px 0;font-weight:normal;font-size:2em;border-top-left-radius:2px;border-top-right-radius:2px}@media (max-width: 1050px){#content{padding:0 70px 100px 70px}h1.title{margin:0 -70px}}@media (max-width: 800px){#content{width:100%;margin-top:0;margin-bottom:0;padding:0 4% 60px 4%}h1.title{margin:0 -5%;padding:40px 5%}}pre,.verse{box-shadow:none;background-color:#f9fbfd;border:1px solid #e2e9f0;color:#586b82;padding:10px;font-family:monospace;overflow:auto;margin:6px 0}#table-of-contents{margin-bottom:50px;margin-top:50px}#table-of-contents h2{margin-bottom:5px}#text-table-of-contents ul{padding-left:15px}#text-table-of-contents>ul{padding-left:0}#text-table-of-contents li{list-style-type:none}#text-table-of-contents a{color:#7c8ca1;font-size:0.95em;text-decoration:none}table{border-color:#586b82;font-size:0.95em}table thead{color:#586b82}table tbody tr:nth-child(even){background:#f9f9f9}table tbody tr:hover{background:#586b82!important;color:white}table .left{text-align:left}table .right{text-align:right}.todo{font-family:inherit;color:inherit}.done{color:inherit}.tag{background:initial}.tag>span{background-color:#eee;font-family:monospace;padding-left:7px;padding-right:7px;border-radius:2px;float:right;margin-left:5px}#text-table-of-contents .tag>span{float:none;margin-left:0}.timestamp{color:#7c8ca1}@media print{@page{margin-bottom:3cm;margin-top:3cm;margin-left:2cm;margin-right:2cm;font-size:10px}#content{border:none}}</style>")

;; for fast insert timestamp as id
(defun dts-org-insert-trace-id ()
  (interactive)
  (insert (format-time-string "%Y%m%d%I%M%S" (current-time))))
(add-hook 'org-mode-hook (lambda ()
                           (define-key org-mode-map (kbd "C-c t")
                             'dts-org-insert-trace-id)))


;;;; outline-minor-mode
;; local bind key for `outline-minor-mode'

(defvar dts/tag-cmd nil "TAG command, saved for chain call")
(defun dts/save-tag-cmd ()
  "Save to command to `dts/tag-cmd'

This function first check `current-local-map' for TAB, then
check `current-global-map'.
"
  (let ((ltab (lookup-key (current-local-map) (kbd "TAB")))
        (gtab (lookup-key (current-global-map) (kbd "TAB"))))
    (if (and
         (not (eq ltab dts/tag-cmd))
         (not (eq ltab 'dts/outline-minor-mode-tag-toggle)))
        (setq dts/tag-cmd ltab))
    (if (not dts/tag-cmd)
        (if (and
             (not (eq gtab dts/tag-cmd))
             (not (eq gtab 'dts/outline-minor-mode-tag-toggle)))
            (setq dts/tag-cmd gtab)))
    (make-local-variable 'dts/tag-cmd)))

(defun dts/outline-minor-mode-tag-toggle ()
  "Toggle outline mode heading"
  (interactive)
  (message "dts/outline-minor-mode-tag-toggle")
  ;; first check whether current line is a header
  (if (outline-on-heading-p)
      (outline-toggle-children)
    (if dts/tag-cmd
        (progn (message "call dts/tag-cmd")
               (funcall dts/tag-cmd))
      (message "dts/tag-cmd nil"))))

(defun dts/outline-minor-mode-hook ()
"DTS hook"
  (message "dts/outline-minor-mode-hook")
  (if (eq major-mode 'c-mode)
      (progn
        (setq outline-regexp dts/c-outline-regexp)
        (setq outline-level 'dts/c-outline-level)))
  (local-set-key (kbd "C-c C-c") 'outline-hide-entry)
  (local-set-key (kbd "C-c C-e") 'outline-show-entry)
  (local-set-key (kbd "C-c C-d") 'outline-hide-subtree)
  (local-set-key (kbd "C-c C-s") 'outline-show-subtree)
  (local-set-key (kbd "C-c C-l") 'outline-hide-leaves)
  (local-set-key (kbd "C-c C-k") 'outline-show-branches)
  (local-set-key (kbd "C-c C-i") 'outline-show-children)
  (local-set-key (kbd "C-c C-t") 'outline-hide-body)
  (local-set-key (kbd "C-c C-a") 'outline-show-all)
  (local-set-key (kbd "C-c C-q") 'outline-hide-sublevels)
  (local-set-key (kbd "C-c C-o") 'outline-hide-other)
  (local-set-key (kbd "M-n") 'outline-next-visible-heading)
  (local-set-key (kbd "M-p") 'outline-previous-visible-heading)
  ;; save current command bound to TAB
  (dts/save-tag-cmd)
  (local-set-key (kbd "TAB") 'dts/outline-minor-mode-tag-toggle))

(add-hook 'outline-minor-mode-hook 'dts/outline-minor-mode-hook)

;;;; powerline

(setq mode-line-format nil)
(eval-after-load 'powerline
  '(progn
     (message "%s" "doerthous powerline setting...")
     (dts-powerline-theme)))

(defun dts-buffer-coding-system ()
  "Doerthous Utils
    The coding system of current buffer."
  (let*
      ((fmt (format "%s" buffer-file-coding-system))
       (fmt (replace-regexp-in-string
             "prefer-\\|-dos\\|-mac\\|-unix\\|chinese-\\|japan-" ""
             fmt)))
    (upcase fmt)))

(defun dts-buffer-newline-format ()
  "Doerthous Utils
    The newline format of current buffer, CRLF for dos, CR for unix and mac."
  (let*
      ((fmt (format "%s" buffer-file-coding-system))
       (dos (string-match "-dos" fmt)))
    (if dos "CRLF" "CR")))

(defmacro dts-current-point-percentage ()
  "Doerthous Utils
    The percentage of the current point in the current buffer from top."
  (/ (* 100 (point)) (point-max))
  ;(/ (* 100 (- (line-number-at-pos) 1)) (count-lines (point-min) (point-max)))
  )

(defun dts-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir)))))
                     (if active
                         (let*
                             ((lhs (list (powerline-raw " %* %b " face0)
                                         (when (and (boundp 'which-func-mode) which-func-mode)
					                       (powerline-raw which-func-format face0 'l))
                                         (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
					                       (powerline-raw erc-modified-channels-object face1 'l))
                                         (powerline-major-mode face1 'l)
                                         (powerline-process face1)
                                         (powerline-minor-modes face1 'l)
                                         (powerline-raw " " face1)
                                         (powerline-narrow face1 'l)
                                         (powerline-vc face2 'r)
                                         (when (bound-and-true-p nyan-mode)
					                       (powerline-raw (list (nyan-create)) face2 'l))))
                              (rhs (list (powerline-raw global-mode-string face2 'r)
                                         (powerline-raw "Ln %l" face1 'l)
                                         (powerline-raw ", " face1)
                                         (powerline-raw "Col %c" face1 'r)
                                         (powerline-raw "  " face1)
                                         (powerline-raw (format "Spaces: %d" tab-width) face1 'r)
                                         (powerline-raw "  " face1)
                                         (powerline-raw (dts-buffer-coding-system) face1 'r)
                                         (powerline-raw "  " face1)
                                         (powerline-raw (dts-buffer-newline-format) face1 'r)
                                         (powerline-raw (format "%3d%%%%" (dts-current-point-percentage)) face0 'l)
                                         (powerline-fill face0 0))))
                           (concat (powerline-render lhs)
                                   (powerline-fill face2 (powerline-width rhs))
                                   (powerline-render rhs)))
                       (concat (powerline-raw " %* %b" face0)
                               (powerline-fill face0 0))))))))

(require 'powerline)
(dts-powerline-theme)

;;;; semx

(eval-after-load 'smex
  '(progn
     (message "%s" "doerthous smex setting...")
     (global-set-key (kbd "M-x") 'smex)
     (global-set-key (kbd "M-X") 'smex-major-mode-commands)
     ;;(global-set-key (kbd "C-c C-c M-x") 'executen-extended-command) ;; old M-x
     ))

(require 'smex)

;;;; sr-speedbar-mode

(defun dts-disable-linum-in-sr-speedbar ()
  (display-line-numbers-mode 0)
  (message "debug ..."))
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
     (add-hook 'speedbar-mode-hook 'dts-disable-linum-in-sr-speedbar)
     ))

(require 'sr-speedbar)

;;;; transpose-theme

;; transpose-frame
;; function: transpose-frame
;;        +------------+------------+      +----------------+--------+
;;        |            |     B      |      |        A       |        |
;;        |     A      +------------+      |                |        |
;;        |            |     C      |  =>  +--------+-------+   D    |
;;        +------------+------------+      |   B    |   C   |        |
;;        |            D            |      |        |       |        |
;;        +-------------------------+      +--------+-------+--------+
;; function: flip-frame
;;        +------------+------------+      +------------+------------+
;;        |            |     B      |      |            D            |
;;        |     A      +------------+      +------------+------------+
;;        |            |     C      |  =>  |            |     C      |
;;        +------------+------------+      |     A      +------------+
;;        |            D            |      |            |     B      |
;;        +-------------------------+      +------------+------------+
;;
;; function: flop-frame
;;        +------------+------------+      +------------+------------+
;;        |            |     B      |      |     B      |            |
;;        |     A      +------------+      +------------+     A      |
;;        |            |     C      |  =>  |     C      |            |
;;        +------------+------------+      +------------+------------+
;;        |            D            |      |            D            |
;;        +-------------------------+      +-------------------------+
(require 'transpose-frame)

;;;; whitespace
;;;; window-numbering

;; window-numbering
;; use M-1, M-2, ..., M-0 to index window

(eval-after-load 'window-numbering
  '(progn
     (message "%s" "doerthous window-numbering setting...")
     (window-numbering-mode t)
     (defun window-numbering-install-mode-line (&optional position) ())))

(require 'window-numbering)

;;;; Misc configuration

;;;;; Emacs Feature

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-auto-revert-mode 1) ;; enable auto load when file changed outside the emacs
(setq make-backup-files nil) ;; disable backup file
;;(setq auto-save-default nil) ;; disable auto save
(electric-pair-mode 1) ;; auto complete braces
(setq require-final-newline nil) ;; disable auto insert newline at the end of file
(setq inhibit-splash-screen t) ;; disable welcome window will open emacs
(when (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil)) ;; disable scroll bar
(setq-default cursor-type 'bar) ;; change cursor from block to line
(global-hl-line-mode 1) ;; highlight
(tool-bar-mode 0) ;; disable toolbar
(menu-bar-mode 0) ;; disable menu bar
(show-paren-mode t) ;; highlight braces
(add-hook 'window-configuration-change-hook (lambda () (ruler-mode 0))) ;; display a ruler for column
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; full screen

(defalias 'yes-or-no-p 'y-or-n-p) ;; yes-or-no -> y-or-n
(setq default-buffer-file-coding-system 'utf-8) ;; default coding system for new file
(prefer-coding-system 'utf-8)


;;;;; Font
;; Noto Sans Mono
;; Source Code Pro
(if (version< emacs-version "27.0")
    (set-default-font "Source Code Pro" 11)
  (set-frame-font "Source Code Pro" 11))


;;;;; Window Layout

(defvar parameters
  '(window-parameters . ((no-other-window . t)
                         (no-delete-other-windows . t))))

(setq fit-window-to-buffer-horizontally t)
(setq window-resize-pixelwise t)

(setq
 display-buffer-alist
 `(("\\*Buffer List\\*" display-buffer-in-side-window
    (side . top) (slot . 0) (window-height . fit-window-to-buffer)
    (preserve-size . (nil . t)) ,parameters)
   ("\\*Tags List\\*" display-buffer-in-side-window
    (side . right) (slot . 0) (window-width . fit-window-to-buffer)
    (preserve-size . (t . nil)) ,parameters)
   ("\\*\\(?:help\\|grep\\|Completions\\|Messages\\)\\*"
    display-buffer-in-side-window
    (side . bottom) (slot . -1) (preserve-size . (nil . t))
    ,parameters)
   ("\\*\\(?:shell\\|compilation\\)\\*" display-buffer-in-side-window
    (side . bottom) (slot . 1) (preserve-size . (nil . t))
    ,parameters)))

;;; dts-pkgconf.el ends here
