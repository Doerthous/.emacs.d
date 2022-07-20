(defun dts/toggle-shell-window ()
  "dts toggle shell window"
  (interactive)
  (let* ((buf (get-buffer "*shell*"))
         (wnd (get-buffer-window buf)))
    (if (null wnd)
        (shell)
      (delete-window wnd))))

(global-set-key (kbd "C-c j") 'goto-line)
(global-set-key (kbd "C-c i") 'open-init-file)
(global-set-key (kbd "C-c [") 'hs-show-block)
(global-set-key (kbd "C-c ]") 'hs-hide-block)
(global-set-key (kbd "C-c {") 'hs-show-all)
(global-set-key (kbd "C-c }") 'hs-hide-all)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c m") 'set-mark-command)
(global-set-key (kbd "C-c x") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c s") 'dts/toggle-shell-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highest priority keymap
;;
;; How to use:
;;   1. C-c k enable/disable this mode
;;   2. when enable, the following keymaps have the highest priority
(defvar dts-keymap (make-sparse-keymap))
(defvar dts-hs-toggle-flag nil)
(defun dts-hs-toggle (&optional start end)
  (interactive "r")
  ;;(hs-org/minor-mode)
  ;;(hide-ifdef-mode)
  (let* ((dts-hs-range (get-text-property 450 'dts-hs-range)))
    (when (null dts-hs-range)
        (message "hide ifdef")
        (add-text-properties start end (list 'dts-hs-range (list start end)))
        (hide-ifdef-block))
    (when (not (null dts-hs-range))
          (if (remove-text-properties
               (nth 0 dts-hs-range)
               (nth 1 dts-hs-range)
               '(dts-hs-range nil))
              (message "remove dts-hs-range (%d %d)"
                       (nth 0 dts-hs-range) (nth 1 dts-hs-range)))
          (message "show ifdef")
          (call-interactively 'show-ifdef-block)))
  ;;(hs-org/hideshow (kbd "C-c d e f g"))
)

(progn
  (define-key dts-keymap (kbd "C-z")  'repeat)
  (define-key dts-keymap (kbd "S-C-<left>")  'shrink-window-horizontally)
  (define-key dts-keymap (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (define-key dts-keymap (kbd "S-C-<down>")  'shrink-window)
  (define-key dts-keymap (kbd "S-C-<up>")    'enlarge-window)
  (define-key dts-keymap (kbd "TAB") '(lambda () (interactive) (dts-hs-toggle (kbd "TAB"))))
  (define-key dts-keymap (kbd "C-c d e f g") '(lambda () (interactive) (message "dummy")))
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
