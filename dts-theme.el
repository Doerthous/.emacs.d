;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq molokai-theme-kit t)
(load-theme 'molokai t)
(deftheme monokai-overrides) ;; set style for other plugins with monokai theme
(let ((class '((class color) (min-colors 257)))
      (terminal-class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'monokai-overrides
   ;; Company tweaks.
   `(company-tooltip
     ((t :foreground "#1B1D1E"
         :background "#F8F8F0"
         :underline t)))
   `(company-tooltip-selection
     ((t :background "#349B8D"
         :foreground "#F8F8F0")))
   `(company-tooltip-annotation
     ((t :inherit company-tooltip)))
   `(company-tooltip-annotation-selection
     ((t :inherit company-tooltip-selection)))
   `(company-preview
     ((t :inherit company-tooltip-selection)))
   `(company-preview-common
     ((t :inherit company-tooltip)))
   `(company-tooltip-search
     ((t :background "#349B8D"
         :foreground "#F8F8F0")))
   `(company-scrollbar-fg
     ((t :background "#F92672")))
   `(company-scrollbar-bg
     ((t :background "#F8F8F0")))))

(defvar dts-theme-green "#008000")
