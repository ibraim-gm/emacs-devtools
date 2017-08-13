;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; completion-init.el --- Initialization of completion
;;; functionality

;;;###autoload
(defun dt-completion-init ()
  "Initialize the completion framework."

  ;; timer dependent config
  (dt-config-purpose/timer)
  (dt-config-company/timer)

  ;; idle timer dependent config
  (dt-config-ivy/idle)

  ;; immediate/autoload config
  (global-set-key (kbd "C-x g") 'magit-status)
  (dt-config-dumb-jump)
  (dt-config-projectile)
  (dt-config-project-explorer)

  ;; timer init
  (run-with-timer
   1 nil
   (lambda ()
     (require 'window-purpose)
     (require 'company)))

  ;; idle init
  (run-with-idle-timer
   1 nil
   (lambda ()
     (ivy-mode t)
     (dt-config-cheatsheet))))

(defun dt-config-company/timer ()
  (eval-after-load "company"
    '(progn
       (setq company-idle-delay 0.3)
       (setq company-dabbrev-downcase nil)
       (setq company-dabbrev-code-ignore-case t)
       (setq company-show-numbers t)
       (setq company-minimum-prefix-length 2)
       (setq company-auto-complete t)
       (global-company-mode)
       (global-set-key (kbd "C-<tab>") 'company-complete-common-or-cycle)
       ;; revert the changes that spacemacs-theme do to company
       (set-face-attribute 'company-echo-common nil :foreground "firebrick1")
       (set-face-attribute 'company-preview nil :background "blue4" :foreground "wheat")
       (set-face-attribute 'company-preview-common nil :background "blue4" :foreground "red")
       (set-face-attribute 'company-preview-search nil :background "blue1" :foreground "wheat")
       (set-face-attribute 'company-scrollbar-fg nil :background "red")
       (set-face-attribute 'company-scrollbar-bg nil :background "gold")
       (set-face-attribute 'company-tooltip nil :background "yellow" :foreground "black")
       (set-face-attribute 'company-tooltip-annotation nil :foreground "red4")
       (set-face-attribute 'company-tooltip-annotation-selection nil :foreground "red4")
       (set-face-attribute 'company-tooltip-common nil :foreground "red" :background "yellow")
       (set-face-attribute 'company-tooltip-common-selection nil :foreground "red")
       (set-face-attribute 'company-tooltip-selection nil :background "orange1" :foreground "black")
       (set-face-attribute 'company-tooltip-mouse nil :foreground "red" :background "green3")
       (set-face-attribute 'company-tooltip-search nil :foreground "red" :background "yellow")
       (set-face-attribute 'company-tooltip-search-selection nil :foreground "red" :background "orange1"))))

(defun dt-config-ivy/idle ()
  (setq counsel-git-grep-cmd-default "git --no-pager grep --full-name -n --no-color -i -e \"%s\"")
  (setq counsel-ag-base-command "ag --vimgrep --nocolor --nogroup %s")
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  (eval-after-load "ivy"
    '(progn
       (setq ivy-use-virtual-buffers t)
       (setq ivy-re-builders-alist
	     '((t . dt--ivy--regex-plus)))
       (setq ivy-sort-matches-functions-alist
	     '((t)
	       (ivy-switch-buffer . ivy-sort-function-buffer)
	       (counsel-find-file . dt--ivy-sort-files-function)))
       (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
       (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done))))

(defun dt--ivy-sort-files-function (_name candidates)
  "Sort candidates by size, and then by lexicographic order."
  (cl-flet ((remove-suffix (lambda (s) (if (string-suffix-p "/" s) (substring s 0 -1) s))))
    (cl-sort (copy-sequence candidates)
	     (lambda (x y)
	       (let* ((str1 (remove-suffix x))
		      (str2 (remove-suffix y))
		      (len1 (length str1))
		      (len2 (length str2)))
		 (if (= len1 len2) (string< str1 str2) (< len1 len2)))))))

(defun dt--ivy--regex-plus (str)
  "Like ivy-rregex-plus, but always trating `.` as a literal character."
  (ivy--regex-plus (replace-regexp-in-string "\\." "\\." str nil t)))

(defun dt-config-purpose/timer ()
  (global-set-key (kbd "<f11>") 'purpose-toggle-window-purpose-dedicated)
  (global-set-key (kbd "C-c l l") 'purpose-load-window-layout)
  (global-set-key (kbd "C-c l s") 'purpose-save-window-layout)
  (eval-after-load "window-purpose"
    '(progn
       (purpose-mode))))

(defun dt-config-dumb-jump ()
  (global-set-key (kbd "C-M-g") 'dumb-jump-go)
  (global-set-key (kbd "C-M-p") 'dumb-jump-back)
  (eval-after-load "dumb-jump"
    '(progn
       (dumb-jump-mode))))

(defun dt-config-projectile ()
  (global-set-key (kbd "C-c p m") 'projectile-commander)
  (global-set-key (kbd "C-c p t") 'projectile-toggle-between-implementation-and-test)
  (global-set-key (kbd "C-c p P") 'projectile-test-project)
  (global-set-key (kbd "C-c p c") 'projectile-compile-project)
  (global-set-key (kbd "C-c p i") 'projectile-invalidate-cache)
  (global-set-key (kbd "C-c p b") 'counsel-projectile-switch-to-buffer)
  (global-set-key (kbd "C-c p d") 'counsel-projectile-find-dir)
  (global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)
  (global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)
  (eval-after-load "projectile"
    '(progn
       (projectile-global-mode)
       (counsel-projectile-on)))
  (eval-after-load "counsel-projectile"
    '(progn
       (counsel-projectile-on))))

(defun dt-config-project-explorer ()
  (global-set-key (kbd "C-c t") 'sr-speedbar-toggle)
  (eval-after-load "sr-speedbar"
    '(progn
       (setq sr-speedbar-right-side nil)
       (setq sr-speedbar-skip-other-window-p t))))

(defun dt-config-cheatsheet ()
  (cheatsheet-add :group 'Display :key "C-x C-+" :description "text-scale-adjust")
  (cheatsheet-add :group 'Navigation :key "C-c r" :description "iy-resume")
  (cheatsheet-add :group 'Navigation :key "C-c g" :description "counsel-git")
  (cheatsheet-add :group 'Navigation :key "C-c j" :description "counsel-git-grep")
  (cheatsheet-add :group 'Navigation :key "C-c k" :description "counsel-ag")
  (cheatsheet-add :group 'Navigation :key "C-M-g" :description "dumb-jump-go")
  (cheatsheet-add :group 'Navigation :key "C-M-p" :description "dumb-jump-back")
  (cheatsheet-add :group 'Layout :key "C-c l l" :description "purpose-load-window-layout")
  (cheatsheet-add :group 'Layout :key "C-c l s" :description "purpose-save-window-layout")
  (cheatsheet-add :group 'Project :key "C-x g" :description "magit-status")
  (cheatsheet-add :group 'Project :key "C-x M-g" :description "magit-file-popup")
  (cheatsheet-add :group 'Project :key "C-c t" :description "project-explorer-toggle")
  (cheatsheet-add :group 'Project :key "C-c p p" :description "counsel-projectile-switch-project")
  (cheatsheet-add :group 'Project :key "C-c p f" :description "counsel-projectile-find-file")
  (cheatsheet-add :group 'Project :key "C-c p d" :description "counsel-projectile-find-dir")
  (cheatsheet-add :group 'Project :key "C-c p b" :description "counsel-projectile-switch-to-buffer")
  (cheatsheet-add :group 'Project :key "C-c p i" :description "projectile-invalidate-cache")
  (cheatsheet-add :group 'Project :key "C-c p c" :description "projectile-compile-project")
  (cheatsheet-add :group 'Project :key "C-c p P" :description "projectile-test-project")
  (cheatsheet-add :group 'Project :key "C-c p t" :description "projectile-toggle-between-implementation-and-test")
  (cheatsheet-add :group 'Project :key "C-c p m" :description "projectile-commander")
  (cheatsheet-add :group 'Markdown :key "C-c C-a" :description "Add links")
  (cheatsheet-add :group 'Markdown :key "C-c C-i" :description "Add images")
  (cheatsheet-add :group 'Markdown :key "C-c C-a" :description "Add styles")
  (cheatsheet-add :group 'Markdown :key "C-c C-t" :description "Add headers")
  (cheatsheet-add :group 'Markdown :key "C-c -" :description "Add rules")
  (cheatsheet-add :group 'Markdown :key "C-c C-c" :description "Action menu")
  (cheatsheet-add :group 'Markdown :key "C-c C-c t" :description "Generate or update markdown TOC")
  (global-set-key (kbd "C-?") 'cheatsheet-show)
  (which-key-mode))

(provide 'completion-init)
