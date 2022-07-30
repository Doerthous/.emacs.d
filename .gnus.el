;; set email reader
(setq gnus-secondary-select-methods '((nnml "")))

;; 设置接收邮件的参数
(setq mail-sources
      '((pop :server "192.168.1.2"
         :user "doerthous@dts.psn"
         :password "123456")))

;; 设置发送邮件的参数
(setq send-mail-function 'smtpmail-send-it ;; Not for gnus
      message-send-mail-function 'smtpmail-send-it ;; For gnus
      smtpmail-stream-type 'plain
      smtpmail-smtp-server "192.168.1.2"
      smtpmail-smtp-service 25
      smtpmail-auth-credentials "~/.authinfo")
