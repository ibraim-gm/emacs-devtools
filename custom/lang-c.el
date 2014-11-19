;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-c.el --- Editing options for C


;;; see http://www.emacswiki.org/emacs/IndentingC for explanation
(setq-default c-default-style "linux"
              c-basic-offset 2)

;;; Idea from http://ergoemacs.org/emacs/elisp_determine_cursor_inside_string_or_comment.html
(defun smart-newline-and-indent ()
  (interactive)
  (if (nth 4 (syntax-ppss))
      (c-indent-new-comment-line)
    (newline-and-indent)))

(add-hook 'c-mode-hook
          (lambda ()
            (c-set-offset 'case-label 2)
            (setq comment-padding " * ")
            (define-key c-mode-map (kbd "\r") 'smart-newline-and-indent)))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq comment-padding " * ")
            (define-key c++-mode-map (kbd "\r") 'smart-newline-and-indent)))

(provide 'lang-c)
