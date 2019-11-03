(defun doerthous-c-run()
  (interactive)
  (compile (format "gcc %s -o out.exe && out.exe"
                   (buffer-file-name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; define a minor mode for myself
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-minor-mode doerthous-tools-mode
  "some tools used for text process"
  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " Doerthous tools"
  ;; The minor mode bindings.
  ;;'(([C-c] . doerthous-tools-version))
  :group 'doerthous-tools
  ;; tools
  (defun doerthous-tools-version()
    (interactive)
    (message "doerthous tools version 1.0"))
  (defun doerthous-tools-checksum()
    "calculate the checksum of the selected region which content likes \"FF 02 C2 ...\""
    (interactive)
    (let ((ret 0) (selected (buffer-substring (region-beginning) (region-end))))
      (setq selected (concat "("
                             (replace-regexp-in-string "[0-9A-Fa-f]." (lambda (old) (concat "#x" old))
                                                       (replace-regexp-in-string "\n" "" selected))
                             ")"))
      (message "0x%02X" (% (apply '+ (car (read-from-string selected))) 256))))
  ;; keymap
  (defvar doerthous-tools-mode-map (make-sparse-keymap) "doerthous-tools-mode keymap.")
  (define-key doerthous-tools-mode-map (kbd "C-c C-v") 'doerthous-tools-version))