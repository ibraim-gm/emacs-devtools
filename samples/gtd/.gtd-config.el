;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2014 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; gtd/.gtd-config.el --- Sample GTD configuration file
;;; Please, remember to copy all the files on the GTD directory
;;; and the customize the following configurations to your liking


;; Set where the data will be stored
(setq org-agenda-files '("~/.gtd/newgtd.org" "~/.gtd/projects.org" "~/.gtd/someday.org"))
(setq org-refile-targets '((org-agenda-files . (:level . 1))))

;; Enable some keywords. You might want to customize this list to your personal preferences.
;; Note how I separated the states to make 'done','cancelled', etc. workflow-generic.
(setq org-todo-keywords
  '(; only 'to-do' states:
    (sequence "INBOX(n)" "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "CALL(c)" "MAYBE(m)" "|")
    ; 'to-do' states and 'closed' states
    (sequence "BUG(b)" "QUESTION(q)" "FEATURE(e)" "TESTING(t)" "|" "FIXED(f)" "WONTFIX(o)" "DUPLICATE(u)")
    ; only 'closed' states
    (sequence "|" "DONE(d)" "CANCELLED(x)" "DELEGATED(g)")))

;; Now, let's change to more interesting colors
(setq org-todo-keyword-faces
  '(("INBOX"       . (:foreground "yellow"        :weight bold))
    ("TODO"        . (:foreground "dark orange"   :weight bold))
    ("STARTED"     . (:foreground "green yellow"  :weight bold))
    ("WAITING"     . (:foreground "medium purple" :weight bold))
    ("APPT"        . (:foreground "orchid"        :weight bold))
    ("CALL"        . (:foreground "hot pink"      :weight bold))
    ("MAYBE"       . (:foreground "MediumOrchid1" :weight bold))

    ("BUG"         . (:foreground "orange red"    :weight bold))
    ("QUESTION"    . (:foreground "hot pink"      :weight bold))
    ("FEATURE"     . (:foreground "DeepSkyBlue1"  :weight bold))
    ("FIXED"       . (:foreground "green"         :weight bold))
    ("WONTFIX"     . (:foreground "SlateGray4"    :weight bold))
    ("DUPLICATE"   . (:foreground "SteelBlue1"    :weight bold))

    ("DONE"        . (:foreground "green"         :weight bold))
    ("CANCELLED"   . (:foreground "OliveDrab"     :weight bold))
    ("DELEGATED"   . (:foreground "OliveDrab"     :weight bold))))

;; The same thing for tags: first we define shotcuts, then colors
;; Again, you might want to customize this list
(setq org-tag-alist '(("@work" . ?w)
                      ("@home" . ?h)
                      ("@internet" . ?i)
                      ("@project" .?p)
                      ("@scheduled" .?s)
                      ("@computer" . ?c)
                      ("@reading" . ?r)
                      ("@errands" . ?e)))

(setq org-tag-faces
  '(("@work"      . (:foreground "cyan1"         :weight bold))
    ("@home"      . (:foreground "salmon1"       :weight bold))
    ("@internet"  . (:foreground "SeaGreen1"     :weight bold))
    ("@computer"  . (:foreground "PaleGreen1"    :weight bold))
    ("@project"   . (:foreground "burlywood1"    :weight bold))
    ("@reading"   . (:foreground "burlywood3"    :weight bold))
    ("@errands"   . (:foreground "MediumPurple1" :weight bold))
    ("@scheduled" . (:foreground "MediumPurple1" :weight bold))))

;; Now, it's time to build some custom views.
;; If you customized any of the above itens, you might want to make some changes here
(setq org-agenda-custom-commands
  '(("w" "Agenda for work"
     ((agenda "")
      (todo "INBOX")
      (tags-todo "+@work-@scheduled-@internet-@computer/!-INBOX-MAYBE")
      (tags-todo "+@internet-@home|+@computer-@home/!-INBOX-MAYBE")
      (tags-todo "-@errands-@scheduled/!+WAITING|+CALL")
      (tags-todo "+@errands/!-INBOX-MAYBE")))
    ("h" "Agenda for home"
     ((agenda "")
      (todo "INBOX")
      (tags-todo "+@home-@scheduled-@internet-@computer/!-INBOX-MAYBE")
      (tags-todo "+@internet-@work|+@computer-@work/!-INBOX-MAYBE")
      (tags-todo "-@errands-@scheduled/!+WAITING|+CALL")
      (tags-todo "+@errands/!-INBOX-MAYBE")))
    ("p" "Project review"
     ((agenda "")
      (tags-todo "@project-@work-@home/!-INBOX-MAYBE")
      (tags-todo "@project/!+INBOX|+MAYBE")
      (tags-todo "@project")))
    ("s" "Weekly review"
     ((agenda "")
      (tags-todo "things|books|games|movies/!-MAYBE")
      (tags-todo "things/+MAYBE")
      (tags-todo "books/+MAYBE")
      (tags-todo "games/+MAYBE")
      (tags-todo "movies/+MAYBE")))
    ("i" "Inbox itens"
     ((agenda "")
      (todo "INBOX")))
    ("e" "Dangling itens"
     ((agenda "")
      (tags-todo "-@work-@home/!-INBOX-MAYBE")))))


;; Capture templates. You now the drill by now: customize to your needs
(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/.gtd/newgtd.org" "Tasks")
     "* INBOX %^{Title} \n  %i%?\n\n")

    ("b" "Bug" entry (file+headline "~/.gtd/newgtd.org" "Tasks")
     "* BUG %^{Bug} :@inbox:\n  %i%?\n\n")

    ("e" "Enhancement" entry (file+headline "~/.gtd/newgtd.org" "Tasks")
     "* ENHANCEMENT %^{Enhancement} :@inbox:\n  %i%?\n\n")

    ("l" "Book to read" entry (file+headline "~/.gtd/someday.org" "Books to read")
     "* TODO %^{Book Title} \n  %i%?\n\n")

    ("g" "Game to buy" entry (file+headline "~/.gtd/someday.org" "Games to buy")
     "* TODO %^{Game Title} \n  %i%?\n\n")

    ("m" "Movie to watch" entry (file+headline "~/.gtd/someday.org" "Movies to watch")
     "* TODO %^{Movie Title} \n  %i%?\n\n")

    ("o" "Thing to do" entry (file+headline "~/.gtd/someday.org" "Things to do")
     "* TODO %^{what you might do?} :things:\n  %i%?\n\n")))

;; default warning for deadlines
(setq org-deadline-warning-days 10)

;; always show inherited tags
(setq org-agenda-show-inherited-tags 'always)

;; Shortcut to capture
(define-key global-map "\C-crc" 'org-capture)

(defun place-agenda-tags ()
  "Put the agenda tags by the right border of the agenda window."
  (setq org-agenda-tags-column (- 4 (window-width)))
  (org-agenda-align-tags))

(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)

;; shortcut to call the agenda
(define-key global-map [f7] '(lambda ()
                               (interactive)
                               (org-agenda)
                               (delete-other-windows)))
