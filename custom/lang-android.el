;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-android.el --- Editing support for Android projects

;; require
(require 'android-mode)

(add-hook 'android-mode-hook
          (lambda ()
            (interactive)
            (define-key android-mode-map [f5] 'android-ant-debug)
            (define-key android-mode-map [C-f5] 'android-start-emulator)
            (define-key android-mode-map [f6] 'android-start-app)))

(provide 'lang-android)
