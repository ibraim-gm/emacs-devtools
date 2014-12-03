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
    (sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "CALL(c)" "|")
    ; 'to-do' states and 'closed' states
    (sequence "BUG(b)" "QUESTION(q)" "ENHANCEMENT(e)" "TESTING(t)" "|" "FIXED(f)" "WONTFIX(o)" "DUPLICATE(u)")
    ; only 'closed' states
    (sequence "|" "DONE(d) CANCELED(x) DELEGATED(g)")))

;; Now, let's change to more interesting colors
(setq org-todo-keyword-faces
  '(("TODO"        . (:foreground "orange red"    :weight bold))
    ("STARTED"     . (:foreground "yellow"        :weight bold))
    ("WAITING"     . (:foreground "medium purple" :weight bold))
    ("APPT"        . (:foreground "orchid"        :weight bold))
    ("CALL"        . (:foreground "hot pink"      :weight bold))

    ("BUG"         . (:foreground "orange red"    :weight bold))
    ("QUESTION"    . (:foreground "hot pink"      :weight bold))
    ("ENHANCEMENT" . (:foreground "DeepSkyBlue1"  :weight bold))
    ("FIXED"       . (:foreground "green"         :weight bold))
    ("WONTFIX"     . (:foreground "SlateGray4"    :weight bold))
    ("DUPLICATE"   . (:foreground "SteelBlue1"    :weight bold))

    ("DONE"        . (:foreground "green"         :weight bold))
    ("CANCELLED"   . (:foreground "OliveDrab"     :weight bold))
    ("DELEGATED"   . (:foreground "OliveDrab"     :weight bold))))

;; The same thing for tags: first we define shotcuts, then colors
;; Again, you might want to customize this list
(setq org-tag-alist '(("@inbox" . ?n)
                      ("@work" . ?w)
                      ("@home" . ?h)
                      ("@internet" . ?i)
                      ("@someday" . ?m)
                      ("@projects" .?p)
                      ("@scheduled" .?s)
                      ("@computer" . ?c)
                      ("@reading" . ?r)
                      ("@errands" . ?e)))

(setq org-tag-faces
  '(("@inbox"     . (:foreground "yellow"        :weight bold))
    ("@someday"   . (:foreground "yellow"        :weight bold))
    ("@work"      . (:foreground "cyan1"         :weight bold))
    ("@home"      . (:foreground "salmon1"       :weight bold))
    ("@internet"  . (:foreground "SeaGreen1"     :weight bold))
    ("@computer"  . (:foreground "PaleGreen1"    :weight bold))
    ("@projects"  . (:foreground "burlywood1"    :weight bold))
    ("@reading"   . (:foreground "burlywood3"    :weight bold))
    ("@errands"   . (:foreground "MediumPurple1" :weight bold))
    ("@scheduled" . (:foreground "MediumPurple1" :weight bold))))

;; Now, it's time to build some custom views.
;; If you customized any of the above itens, you might want to make some changes here
(setq org-agenda-custom-commands
  '(("w" "Agenda for work"
     ((agenda "")
      (tags-todo "+@inbox-@someday")
      (tags-todo "+@work-@scheduled-@internet-@computer-@someday")
      (tags-todo "+@internet-@home-@someday|+@computer-@home-@someday")
      (tags-todo "+@errands")))
    ("h" "Agenda for home"
     ((agenda "")
      (tags-todo "+@inbox-@someday")
      (tags-todo "+@home-@scheduled-@internet-@computer-@someday")
      (tags-todo "+@internet-@work-@someday|+@computer-@work-@someday")
      (tags-todo "+@errands")))
    ("p" "Project review"
     ((agenda "")
      (tags-todo "@project+@inbox|@project-@work-@home-@inbox")
      (tags-todo "@project")))
    ("s" "Weekly review"
     ((agenda "")
      (tags-todo "@someday+@inbox")
      (tags-todo "@someday+books")
      (tags-todo "@someday+games")
      (tags-todo "@someday+movies")
      (tags-todo "@someday+things")))
    ("i" "Inbox itens"
     ((agenda "")
      (tags-todo "+@inbox-@someday")))
    ("e" "Dangling itens"
     ((agenda "")
      (tags-todo "-@inbox-@work-@home-@someday")))))


;; Capture templates. You now the drill by now: customize to your needs
(setq org-capture-templates
  '(("t" "Todo" entry (file+headline "~/.gtd/newgtd.org" "Tasks")
     "* TODO %^{Title} :@inbox:\n  %i%?\n\n")

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
(setq org-deadline-warning-days 15)

;; Shortcut to capture
(define-key global-map "\C-crc" 'org-capture)

;; shortcut to call the agenda
(define-key global-map [f7] '(lambda ()
                               (interactive)
                               (org-agenda)
                               (delete-other-windows)))
