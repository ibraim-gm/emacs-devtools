;;; init.el --- Initial setup

;; Emacs-DevTools - An easy emacs setup for developers
;; Copyright (C) 2017 by it's authors.
;;
;; Author: Rafael Ibraim <ibraim.gm@gmail.com>
;; URL: https://github.com/ibraimgm/emacs-devtools
;;
;; This file is NOT part of GNU Emacs.
;; See LICENSE, AUTHORS.

;;; Commentary:
;;
;; This file is the main initialization code when the user
;; starts Emacs without a proper init file.
;;
;; After that, running `M-x dt-install` install all the needed
;; packages and generates an `.emacs` in the user current directory

;;; Code:
(package-initialize)
(setq package-enable-at-startup nil)

(load (concat user-emacs-directory "dt-const.el"))
(add-to-list 'load-path dt-src-dir)
(dt-update-all-autoloads)

;;--- Missing from 'general.el'
;; First column marker in red.
;; (defun custom-column-marker-setter (orig-fun &rest args)
;;   (set-face-background column-marker-1-face "red")
;;   (apply orig-fun args))

;; (advice-add 'column-marker-1 :around #'custom-column-marker-setter)

;; Now, for each language that you want a column marker, you should use e.g:
;; -> (add-hook 'lisp-mode-hook
;; ->           (lambda ()
;; ->             (interactive)
;; ->             (column-marker-1 80)))
;; To mark column 80 in red. This is not enabled in any language by default

;; (put 'eval-expression 'disabled nil)
;; (put 'set-goal-column 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'eval-expression 'disabled nil)
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)

;; (global-set-key [C-f12] 'eshell)

;; Local Variables:
;; coding: utf-8-unix
;; End:

(provide 'init)
;;; init.el ends here
