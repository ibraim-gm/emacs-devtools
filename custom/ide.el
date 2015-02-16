;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; ide.el --- Setup CEDET, ECB and  Escreen to make emacs work
;;; more like an IDE.
;;; Take a look at samples/sample-.emacs-custom for an example
;;; of the layout I use.

;; From emacs 24 onwards, cedet is builtin. We only need to worry about
;; ecb and escreen
(install-if-needed 'ecb)
(install-if-needed 'escreen)
(install-if-needed 'rainbow-delimiters)

(require 'ecb-autoloads)
(require 'cedet)
(require 'semantic/sb)
(require 'srecode)

(global-ede-mode 1)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(global-srecode-minor-mode 1)
(setq ecb-tip-of-the-day nil)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Auxiliary funcions and variables for screen swapping support
;; the whole point of those routines is to 'remember' on wich screen
;; ecb was last activated and enable/disable its layout automatically
;; when switching screens.
(defvar *ecb-is-active* nil)
(defvar *escreen-is-installed* nil)
(setf ecb-winman-escreen-number 99) ;; just a trick for the initial screen

(defun ibraim/configure-escreen-setup ()
  "'Glue' ECB and Escreen functionality, installing everything on the correct
order. This initialization is a bit heavy, so this is executed only once and
only if needed (if the user never activate ecb or never switch screens, this
isn't loaded)."
  (unless *escreen-is-installed*
    (ecb-activate)
    (ecb-deactivate)
    (ecb-winman-escreen-enable-support)
    (escreen-install)
    (setf *escreen-is-installed* t)))

(defun ibraim/activate-ide-for-current-screen ()
  "Activate/Deactivate ECB for the current screen. The setting is remembered when
you switch screens."
  (interactive)
  (cond
   (*ecb-is-active* (ecb-deactivate))
   (t (ibraim/configure-escreen-setup)
      (setf ecb-winman-escreen-number (escreen-get-current-screen-number))
      (ecb-activate))
   (setf *ecb-is-active* (not *ecb-is-active*))))

(defun ibraim/escreen-goto-screen (number)
  "Switch to a given screen number."
  (ibraim/configure-escreen-setup)
  (cond
   ((member number (escreen-get-active-screen-numbers)) (escreen-goto-screen number))
   (t (escreen-create-screen) (ibraim/escreen-goto-screen number))))

;; I want some buffers to really stand out, instead of being trapped on the tiny
;; compilation/repl buffer. This give them some breathing room
(defadvice ecb-compilation-buffer-p (around ibraim/ecb-compilation-buffer-p activate)
  (let ((buffer (ecb-buffer-obj (ad-get-arg 0))))
    (cond
     ((null buffer) ad-do-it)
     ((string= (buffer-name buffer) "*slime-compilation*") nil)
     ((string= (buffer-name buffer) "*nrepl-error*") nil)
     ((string= (buffer-name buffer) "*grep*") nil)
     ((string= (buffer-name buffer) "*eshell*") ad-do-it)
     (t ad-do-it))))

;; Now it's for some custom keybindings!
(global-set-key [f11] 'other-window)                          ; Useful to switch between code/compilation buffers
(global-set-key [f4] 'find-grep-dired)                        ; A nice shortcut to do a grep search
(global-set-key [f6] 'ecb-redraw-layout)                      ; Redraw the layout
(global-set-key [f9] 'ibraim/activate-ide-for-current-screen) ; activate/deactivate ECB

;; Shortcuts to switch screens. Windows users will be a bit pissed off with M-f4...
(global-set-key [M-f1]  '(lambda () (interactive) (ibraim/escreen-goto-screen 0)))
(global-set-key [M-f2]  '(lambda () (interactive) (ibraim/escreen-goto-screen 1)))
(global-set-key [M-f3]  '(lambda () (interactive) (ibraim/escreen-goto-screen 2)))
(global-set-key [M-f4]  '(lambda () (interactive) (ibraim/escreen-goto-screen 3)))
(global-set-key [M-f5]  '(lambda () (interactive) (ibraim/escreen-goto-screen 4)))
(global-set-key [M-f6]  '(lambda () (interactive) (ibraim/escreen-goto-screen 5)))
(global-set-key [M-f7]  '(lambda () (interactive) (ibraim/escreen-goto-screen 6)))
(global-set-key [M-f8]  '(lambda () (interactive) (ibraim/escreen-goto-screen 7)))
(global-set-key [M-f9]  '(lambda () (interactive) (ibraim/escreen-goto-screen 8)))
(global-set-key [M-f10] '(lambda () (interactive) (ibraim/escreen-goto-screen 9)))
(global-set-key [M-f11] '(lambda () (interactive) (ibraim/escreen-goto-screen 10)))
(global-set-key [M-f12] '(lambda () (interactive) (ibraim/escreen-goto-screen 11)))

(provide 'ide)
