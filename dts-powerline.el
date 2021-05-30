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
