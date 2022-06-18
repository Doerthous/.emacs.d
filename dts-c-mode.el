(defun dts-command-c-lisence ()
    (interactive)
  (save-excursion
    (beginning-of-buffer)
    (let ((dts-c-mit-lisence-template
"/*******************************************************************************

  Copyright (c) YEAR

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the “Software”), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  1. Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

  Author: doerthous <doerthous@gmail.com>

*******************************************************************************/

"))
      (insert
       (replace-regexp-in-string "YEAR" (format-time-string "%Y")
                                 dts-c-mit-lisence-template)))))

(defun dts-command-c-header-protect-macro ()
    (interactive)
    (save-excursion
      (beginning-of-buffer)
      (let ((macro
             (concat
              (upcase
               (replace-regexp-in-string
                "[.|-]" "_" (file-relative-name (buffer-file-name)))) "_")))
        (insert (concat "#ifndef " macro))
        (newline)
        (insert (concat "#define " macro))
        (newline)
        (newline)
        (newline)
        (newline)
        (insert (concat "#endif // " macro)))))


;; cc-mode style
(c-add-style "dts-style"
             '((c-basic-offset . 4)     ; Guessed value
               (c-offsets-alist
                (block-close . 0)       ; Guessed value
                (defun-block-intro . +) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (defun-open . 0)        ; Guessed value
                (statement . 0)         ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (topmost-intro . 0)         ; Guessed value
                (case-label . 4) ;
;                (c . doerthous-c-lineup-C-comments)
                )
               ))


;;(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'ggtags-mode)
;;(add-hook 'c-mode-hook 'yas-minor-mode)

(add-hook 'c-mode-hook 'doerthous-c-mode-hook)
(defun doerthous-c-mode-hook()
                                        ;  (set (make-local-variable 'company-backends) '(company-dabbrev company-gtags company-yasnippet))
                                        ;  (local-set-key [C-tab] 'company-gtags)
  (c-set-style "dts-style")
                                        ;  (local-set-key (kbd "C-c C-r") 'doerthous-c-run)
  (puthash "lsc" 'dts-command-c-lisence dts-command-hash)
  (puthash "hpm" 'dts-command-c-header-protect-macro dts-command-hash)
  (puthash "cfh" '(lambda () (progn (dts-command-c-header-protect-macro) (dts-command-c-lisence))) dts-command-hash)
  )
