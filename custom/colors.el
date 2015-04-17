;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; colors.el --- Custom color setup. I'm using a solarized
;;; dark color, with some extra customizations for lisp code.
;;; Note that this requires the built-in theme support from
;;; emacs 24.4+

;; new color themes for emacs 24.4
(install-if-needed 'solarized-theme)

;; while the new theme is much better thant the older,
;; some of the defaults configurations are a bit odd
(setq solarized-use-variable-pitch nil)    ; do not change the font size!
(setq solarized-use-more-italic t)         ; use more italics than usual
(setq solarized-high-contrast-mode-line t) ; make the mode-line more visible
(setq solarized-emphasize-indicators nil)  ; this doesn't help much

;; avoid weird org-mode headings
(setq solarized-scale-org-headlines nil)
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)

;; load teh theme and override some of the colors
(load-theme 'solarized-dark t)

(custom-theme-set-faces 'solarized-dark
                        `(org-agenda-structure ((((class color) (min-colors 89))
                                                 (:foreground "#93a1a1":weight bold :slant normal :inverse-video nil :underline nil))))
                        `(org-level-1 ((((class color) (min-colors 89))
                                        (:inherit 'default :foreground "#268bd2"))))
                        `(org-level-2 ((((class color) (min-colors 89))
                                        (:inherit 'default :foreground "#2aa198"))))
                        `(org-level-3 ((((class color) (min-colors 89))
                                        (:inherit 'default :foreground "#b58900"))))
                        `(org-level-4 ((((class color) (min-colors 89))
                                        (:inherit 'default :foreground "#859900"))))
                        `(org-level-5 ((((class color) (min-colors 89))
                                        (:inherit 'default :foreground "#cb4b16"))))
                        )

;; Some common lisp specific regexp colors.
(font-lock-add-keywords 'lisp-mode
                       '(("(\\(\\(define-\\|def\\|do-\\|with-\\|set\\|get\\|make-\\|and\\|or\\|not\\|null\\)\\(\\s_\\|\\w\\)*\\)"
                          1 font-lock-keyword-face)))

(font-lock-add-keywords 'lisp-mode '(("\\(\\+[a-zA-Z0-9\\-]+\\+\\)" 1 font-lock-constant-face)))

(font-lock-add-keywords 'lisp-mode '(("\\(\\*[a-zA-Z0-9\\-]+\\*\\)" 1 font-lock-variable-name-face)))

;; Extra colors for clojure
(make-face 'clojure-global-var-face)
(make-face 'clojure-keyword-face)
(set-face-foreground 'clojure-global-var-face "salmon")
(set-face-foreground 'clojure-keyword-face "light slate blue")

(font-lock-add-keywords 'clojure-mode '(("\\(@?\\*[a-zA-Z0-9\\-\\?]+\\*\\)" 1 'clojure-global-var-face)))
(font-lock-add-keywords 'clojure-mode '(("\\(\\^?:[a-zA-Z0-9\\?\\#\\-]+\\)" 1 'clojure-keyword-face)))

(provide 'colors)
