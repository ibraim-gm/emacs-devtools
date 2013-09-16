;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012,2013 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; devtools-bootstrap.el --- Initialization code for
;;; internal package management.

;; Start package.el
(require 'cl)
(require 'package)
(package-initialize)

;; Setup some extra repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Define a utility function to install the required packages when needed.
(defvar *package-list-refreshed-p* nil)

(defun install-if-needed (package)
  (when (not (package-installed-p package))
    (when (not *package-list-refreshed-p*)
      (package-refresh-contents)
      (setf *package-list-refreshed-p* t))
    (package-install package)))

(provide 'devtools-bootstrap)
