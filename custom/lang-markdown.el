;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2013 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-markdown.el --- Support to edit markdown

(el-get 'sync 'markdown-mode)

;; Auto-enable for markdown files
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'lang-markdown)
