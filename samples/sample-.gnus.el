;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; sample-.gnus.el --- Sample .gnus.el configuration file for gmail support

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; Put your username/email here
(setq user-mail-address "yourname@gmail.com")
(setq user-full-name "Your Name")

;; Configuring IMAP
;; Please, remember to activate IMAP in your Gmail account
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

;; Configuring SMTP
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; By default, use topic-mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-topic-mode-hook 'gnus-group-list-all-groups)

;; Sort messages by date
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)))
