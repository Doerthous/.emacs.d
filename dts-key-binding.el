(global-set-key (kbd "C-j") 'goto-line)
(global-set-key (kbd "C->") 'other-window)
(global-set-key (kbd "C-c i") 'open-init-file)
(global-set-key (kbd "C-c [") 'hs-show-block)
(global-set-key (kbd "C-c ]") 'hs-hide-block)
(global-set-key (kbd "C-c {") 'hs-show-all)
(global-set-key (kbd "C-c }") 'hs-hide-all)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

(if (not (featurep 'tabbar))
    (message "%s" "tabbar is not loaded\n")
    (progn
        (global-set-key [(meta j)] 'tabbar-forward)
        (global-set-key [(meta k)] 'tabbar-backward)))

(if (not (featurep 'expand))
    (message "%s" "expand is not loaded\n")
    (global-set-key (kbd "C-=") 'er/expand-region))