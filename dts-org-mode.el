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
			       ))
