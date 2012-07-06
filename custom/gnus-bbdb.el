;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; gnus-bbdb.el --- Use bbdb to store contact information on Gnus

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/bbdb-2.35/lisp"))

;; code originally from Emacs-Fu
;; http://emacs-fu.blogspot.com.br/2009/08/managing-e-mail-addresses-with-bbdb.html

;; keep ~/ clean; set before loading
(setq bbdb-file "~/.emacs.d/bbdb")

;; loads and initialize
(require 'bbdb)
(require 'bbdb-hooks)
(bbdb-initialize)

(setq
    bbdb-offer-save 1                        ; 1 means save-without-asking
    bbdb-use-pop-up t                        ; allow popups for addresses
    bbdb-electric-p t                        ; be disposable with SPC
    bbdb-popup-target-lines  1               ; very small
    bbdb-dwim-net-address-allow-redundancy t ; always use full name
    bbdb-quiet-about-name-mismatches 2       ; show name-mismatches 2 secs
    bbdb-always-add-address t                ; add new addresses to existing contacts
    bbdb-canonicalize-redundant-nets-p t     ; x@foo.bar.cx => x@bar.cx
    bbdb-completion-type nil                 ; complete on anything
    bbdb-complete-name-allow-cycling t       ; cycle through matches
                                             ; this only works partially
    bbbd-message-caching-enabled t           ; be fast
    bbdb-use-alternate-names t               ; use AKA
    bbdb-elided-display t                    ; single-line addresses

    ;; auto-create addresses from mail
    bbdb/mail-auto-create-p t
    bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
    ;; NOTE: there can be only one entry per header (such as To, From)
    ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html
    '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter")))

;; Hook into gnus
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(provide 'gnus-bbdb)
