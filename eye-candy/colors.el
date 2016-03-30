;;; colors.el -- configs for altering Emacs' colors.
;;; Commentary:
;; Changes:
;; -----------
;; Invert point color (https://www.reddit.com/r/emacs/comments/4c5g4i/help_how_do_i_change_the_cursor_to_have_the_same/)
;;
;;; Code:
(load-file "functions.el")

;;use a variable for easy switching
(setq inverted-mouse-active t)
;;add hook for inverting mouse
(add-hook 'post-command-hook 'inverted-mouse-update)

(provide 'colors)
;;; colors.el ends here
