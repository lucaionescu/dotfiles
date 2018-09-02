;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; show line numbers
(global-linum-mode)

;; do not create annoying backup files
(setq make-backup-files nil)

;; highlight matching paranthesis
(show-paren-mode 1)

;; julia mode
(add-to-list 'load-path "~/.emacs.d/modes/")
  (require 'julia-mode)

;; themes
(add-to-list 'load-path "~/.emacs.d/themes/")

(load-file "~/.emacs.d/themes/klere-theme.el")

