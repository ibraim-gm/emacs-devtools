;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-ant.el --- Editing support for Apache Ant

;; source directory
(add-to-list 'load-path "~/.emacs.d/packages/ant-mode")

;; require
(autoload 'ant-mode "ant-mode" "Major mode for editing Ant build files." t)

;; indent
(add-hook 'ant-mode-hook
          (lambda ()
            (define-key ant-mode-map (kbd "\r") 'newline-and-indent)))

;; auto start on 'build.xml' files
(add-to-list 'auto-mode-alist '("build.xml" . ant-mode))

(provide 'lang-ant)
