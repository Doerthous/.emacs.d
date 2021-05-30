(global-set-key (kbd "C-c j") 'goto-line)
(global-set-key (kbd "C-c i") 'open-init-file)
(global-set-key (kbd "C-c [") 'hs-show-block)
(global-set-key (kbd "C-c ]") 'hs-hide-block)
(global-set-key (kbd "C-c {") 'hs-show-all)
(global-set-key (kbd "C-c }") 'hs-hide-all)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c m") 'set-mark-command)
(global-set-key (kbd "C-c x") 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highest priority keymap
;;
;; How to use:
;;   1. C-c k enable/disable this mode
;;   2. when enable, the following keymaps have the highest priority
(defvar dts-keymap (make-sparse-keymap))
(progn
  (define-key dts-keymap (kbd "C-z")  'repeat)
  (define-key dts-keymap (kbd "S-C-<left>")  'shrink-window-horizontally)
  (define-key dts-keymap (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (define-key dts-keymap (kbd "S-C-<down>")  'shrink-window)
  (define-key dts-keymap (kbd "S-C-<up>")    'enlarge-window)
  )
(define-minor-mode dts-keymap-mode
  "A minor mode so that global key settings override annoying major modes."
  :global t
  :lighter " dts-keys"
  :keymap dts-keymap)
(add-to-list 'emulation-mode-map-alists '(dts-keymap-mode . dts-keymap))
(defun dts-keymap-mode-minibuffer-disable-hook () ;; disable when in minibuffer
  (dts-keymap-mode 0))
(add-hook 'minibuffer-setup-hook 'dts-keymap-mode-minibuffer-disable-hook)
(global-set-key (kbd "C-c k") 'dts-keymap-mode) ;; toggle dts-keymap-mode
