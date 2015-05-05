;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012-2015 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-cmake.el --- Editing support for CMake

;; install and initialization
(add-to-list 'load-path "~/.emacs.d/modules/cmake-mode")
(add-to-list 'load-path "~/.emacs.d/modules/cmake-font-lock")
(require 'cmake-mode)

(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(provide 'lang-cmake)
