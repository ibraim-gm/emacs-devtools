;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; completion-init.el --- Initialization of completion
;;; functionality

;;;###autoload
(defun completion/init ()
  "Initialize the completion framework"
  (global-set-key (kbd "C-c t") 'project-explorer-toggle)
  (setq counsel-git-grep-cmd-default "git --no-pager grep --full-name -n --no-color -i -e \"%s\"")
  (setq counsel-ag-base-command "ag --vimgrep --nocolor --nogroup %s")
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  (dumb-jump-mode)
  (ac-config-default)
  (projectile-global-mode)
  (counsel-projectile-on))

(provide 'completion-init)
