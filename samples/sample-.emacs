;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; sample-.emacs --- Sample .emacs configuration file

;; Directories for custom config and 3rd party scripts
(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/3rd-party"))

;; Configuration options. Activate the ones you want.
;; (require 'general)      ; General configurations for a better environment
;; (require 'colors)       ; Custom color scheme, using color-theme package
;; (require 'ac)           ; Auto-complete support
;; (require 'custom-slime) ; Slime customizations
;; (require 'cucumber)     ; cucumber (aka feature-mode) support
;; (require 'latex)        ; Configuration to use pdfLatex. Requires auctex.
;; (require 'ide)          ; The IDE, based on CEDET/ECB.
;; (require 'screen)       ; Screen module, needed for IDE support.

;; Language support. Just uncomment the lines for the languages you want.
;; the exception is clojure: if you enable clojure, you can't any other
;; lisp, since clojure NEEDS a different version of slime.

; (require 'lang-sbcl)
; (require 'lang-clojure)
; (require 'lang-php)

;; Save/Load custom variables in another file
;; If you want, you can use the file included in samples/sample-.emacs-custom
;; for a start point. Note that this file is (re)written automatically by
;; emcas custom configuration screens.
(setq custom-file "~/.emacs-custom")
(load custom-file)

;; The latest ECB leaves an extra window open, so we delete it
(delete-other-windows)
