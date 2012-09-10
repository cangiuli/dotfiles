; Load evil.
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Stop emacs from spewing files everywhere.
(setq make-backup-files nil)
(setq auto-save-default nil)

; Turn on syntax highlighting.
(global-font-lock-mode 1)

; If you use emacs from a terminal you want to add the following bindings,
; for some reason they work in GUI mode but not in terminal mode.
(global-set-key (kbd "C-c ,") 'agda2-goal-and-context)
(global-set-key (kbd "C-c .") 'agda2-goal-and-context-and-inferred)

