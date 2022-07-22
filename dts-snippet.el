;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(defvar dts-command-hash (make-hash-table :test 'equal))

(defun dts-command (cmd)
  (interactive "sCommand: ")
  (let ((cmd (gethash cmd dts-command-hash)))
    (when cmd (funcall cmd))))
