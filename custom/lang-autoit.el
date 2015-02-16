;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2015 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-autoit.el --- AutoIt3 language support

;; install and initialization
(add-to-list 'load-path "~/.emacs.d/modules/autoit-mode")
(require 'autoit-mode)
(add-to-list 'auto-mode-alist '("\.au3$" . autoit-mode))

;; custom logic for autoit indentation
;; the official one is still a WIP
(defun my-autoit-indent-end-token-p ()
  (or (looking-at "^[ \t]*End*")
      (looking-at "^[ \t]*Next")
      (looking-at "^[ \t]*WEnd")))

; Stolen from http://www.emacswiki.org/emacs/ModeTutorial
(defun my-autoit-indent-line ()
  "Indent autoit code"
  (interactive)
  (beginning-of-line)
  (if (bobp) (indent-to 0)
    (let ((not-indented t) cur-indent)
      (if (or (my-autoit-indent-end-token-p) (looking-at "^[ \t]*Else"))
          (progn
            (save-excursion
              (forward-line -1)
              (setq cur-indent (- (current-indentation) standard-indent)))
            (if (< cur-indent 0)
                (setq cur-indent 0)))
        (save-excursion
          (while not-indented ; Iterate backwards until we find an indentation hint
            (forward-line -1)
            (if (my-autoit-indent-end-token-p)
                (progn
                  (setq cur-indent (current-indentation))
                  (setq not-indented nil))
              (if (looking-at "^[ \t]*\\(If\\|Func\\|While\\|For\\)") ; This hint indicates that we need to indent an extra level
                  (progn
                    (setq cur-indent (+ (current-indentation) standard-indent))
                    (setq not-indented nil))
                (if (bobp)
                    (setq not-indented nil)))))))
      (if cur-indent
          (indent-line-to cur-indent)
        (indent-line-to 0))))) ; If we didn't see an indentation hint, then allow no indentation

(add-hook 'autoit-mode-hook
          (lambda ()
            (setq indent-line-function 'my-autoit-indent-line)))

(provide 'lang-autoit)
