;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; screen.el --- Setup multiple screen support using EScreen.
;;; Also, enable the escreen support for ECB and add various key
;;; bindings to easily access the screens.

(require 'escreen)
(setf ecb-winman-escreen-number 99) ;; Take a look at ide.el

;; This is really nasty: first, start ECB to make ecb-winman-escreen-enable-support avalilable, then
;; installs escreen. However, this makes the *info* buffer visible - the solution is to kill *info* and
;; manually switch to *scratch*.
;; I guess there is a better way to do this, but I don't know how.
(ecb-activate)
(ecb-winman-escreen-enable-support)
(escreen-install)
(kill-buffer "*info*")
(switch-to-buffer "*scratch*")

;; Custom function to activate a new screen. If the screen does not exists, it will be automatically
;; created
(defun ibraim/escreen-goto-screen (number)
  (interactive)
  (cond
   ((member number (escreen-get-active-screen-numbers)) (escreen-goto-screen number))
   (t (escreen-create-screen) (ibraim/escreen-goto-screen number))))

;; Now, let's make all this a bit more accessible.
;; Notice how the first screen starts at zero.
(global-set-key [M-f1] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 0)))

(global-set-key [M-f2] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 1)))

(global-set-key [M-f3] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 2)))

(global-set-key [M-f4] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 3)))

(global-set-key [M-f5] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 4)))

(global-set-key [M-f6] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 5)))

(global-set-key [M-f7] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 6)))

(global-set-key [M-f8] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 7)))

(global-set-key [M-f9] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 8)))

(global-set-key [M-f10] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 9)))

(global-set-key [M-f11] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 10)))

(global-set-key [M-f12] '(lambda ()
                          (interactive)
                          (ibraim/escreen-goto-screen 11)))

(provide 'screen)
