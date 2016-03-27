;;; leader -- evil-leader configurations for Emacs.
;;; Commentary:
;; The leader key is <SPC>
;; This package loads the following key bindings.
;; 
;; f -- find-file
;; e -- load-file
;; bk -- kill-buffer
;; bl -- list-buffers
;; bn -- next-buffer
;; bs -- switch-to-buffer
;; bo -- other-window
;; bwd -- delete-window
;; n -- linum-relative-global-mode
;; mp -- mc/mark-more-like-this-extended
;; butterfly -- butterfly
;; hi -- info
;; hdf -- describe-function
;; hdv -- describe-variable
;; hdk -- describe-key
;; pr -- powerline-reset
;; ol -- org-store-line
;; oa -- org-agenda
;; t -- neotree
;; pr -- powerline-reset
;; ub -- battery
;; up -- proced
;; vv -- vimish-fold
;; vd -- vimish-fold-delete
;; <SPC> -- helm-M-x
;;; Code:
(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader-mode 1)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "e" 'load-file
  "bk" 'kill-buffer
  "bl" 'list-buffers
  "bn" 'next-buffer
  "bs" 'switch-to-buffer
  "bo" 'other-window
  "bwd" 'delete-window
  "n" 'linum-relative-global-mode
  "mp" 'mc/mark-more-like-this-extended
  "butterfly" 'butterfly
  "hi" 'info
  "hdf" 'describe-function
  "hdv" 'describe-variable
  "hdk" 'describe-key
  "pr" 'powerline-reset
  "ol" 'org-store-line
  "oa" 'org-agenda
  "t" 'neotree
  "pr" 'powerline-reset
  "ub" 'battery
  "up" 'proced
  "vv" 'vimish-fold
  "vd" 'vimish-fold-delete
  "<SPC>" 'helm-M-x)

(provide 'leader)
;;; leader.el ends here
