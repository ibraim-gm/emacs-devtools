;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; ide.el --- Setup CEDET/ECB and make emacs work like an IDE.
;;; Take a look at samples/sample-.emacs-custom for an example
;;; of the layout I (Rafael Ibraim) use.

;; Add CEDET and ECB paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet-1.1"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/ecb-2.40"))

;; Fix required to load the new (1.1) cedet
;; There is also a little patch apply to ECB to detect the current CEDET version.
(setq stack-trace-on-error t)

;; Load CEDET
(load (expand-file-name "~/.emacs.d/packages/cedet-1.1/common/cedet.el"))
(semantic-load-enable-code-helpers)

;; Use ECB autoloads
(require 'ecb-autoloads)

;; Screw the tip-of-the-day thing.
(setq ecb-tip-of-the-day nil)

;; Easily switch between ecb windows.
;; Very useful on MY setup.
(global-set-key [f11] 'other-window)

;; Activate/deactivate ecb on the current screen
(defvar *ecb-is-active* nil)
(global-set-key [f9]
                '(lambda ()
                   (interactive)
                   (cond
                    (*ecb-is-active* (ecb-deactivate))
                    (t (setf ecb-winman-escreen-number (escreen-get-current-screen-number)) (ecb-activate)))
                   (setf *ecb-is-active* (not *ecb-is-active*))))

;; A more acessible GREP
(global-set-key [f4] 'find-grep-dired)

;; I want some buffers to really stand out, instead of being trapped on the tiny
;; compilation/repl buffer
(defadvice ecb-compilation-buffer-p (around ibraim/ecb-compilation-buffer-p activate)
  (let ((buffer (ecb-buffer-obj (ad-get-arg 0))))
    (cond
     ((null buffer) ad-do-it)
     ((string= (buffer-name buffer) "*slime-compilation*") nil)
     ((string= (buffer-name buffer) "*grep*") nil)
     (t ad-do-it))))

(provide 'ide)
