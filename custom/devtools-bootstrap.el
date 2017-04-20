;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012,2013 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; devtools-bootstrap.el --- Initialization code for
;;; internal package management.

;; Avoid annoying warnings about cl functions used in runtime.
;; Needed because of the slime/swank integration provided by quicklisp
(require 'bytecomp)
(byte-compile-disable-warning 'cl-functions)

;; Start package.el
(package-initialize)

;; Setup some extra repositories
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
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
